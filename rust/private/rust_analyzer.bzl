# Copyright 2020 Google
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""
Rust Analyzer Bazel rules.

rust_analyzer will generate a rust-project.json file for the
given targets. This file can be consumed by rust-analyzer as an alternative
to Cargo.toml files.
"""

load("@io_bazel_rules_rust//rust:private/rustc.bzl", "BuildInfo")
load("@io_bazel_rules_rust//rust:private/utils.bzl", "find_toolchain")

# We support only these rule kinds.
_rust_rules = [
    "rust_library",
    "rust_binary",
]

RustTargetInfo = provider(
    "RustTargetInfo holds rust crate metadata for targets",
    fields = {
        "name": "target name",
        "root": "crate root",
        "edition": "edition",
        "deps": "dependencies",
        "transitive_deps": "closure of all transitive dependencies",
        "cfgs": "compilation cfgs",
        "env": "Environment variables, used for the `env!` macro",
    },
)

# Gets the crate_root file from the context.
# If the file is not specified, find lib.rs or main.rs
# in a library or binary rule respectively.
def fetch_crate_root_file(ctx):
    crate_root = ctx.rule.attr.crate_root
    if not crate_root:
        if len(ctx.rule.attr.srcs) == 1:
            crate_root = ctx.rule.attr.srcs[0]
        else:
            for src in ctx.rule.attr.srcs:
                file_name = src.label.name
                crate_type = ctx.rule.attr.crate_type
                if crate_type == "bin":
                    if file_name.endswith("main.rs"):
                        crate_root = src
                        break
                elif crate_type in ("rlib", "dylib", "cdylib", "staticlib", "proc-macro"):
                    if file_name.endswith("lib.rs"):
                        crate_root = src
                        break
                else:
                   print("MISSED CRATE TYPE: ", crate_type)

    # The rules are structured such that the crate_root path will always be
    # the first element in the in the depset
    return crate_root.files.to_list()[0].path

def _rust_project_aspect_impl(target, ctx):
    if ctx.rule.kind not in _rust_rules:
        return []

    toolchain = find_toolchain(ctx)

    # extract the crate_root path
    edition = ctx.rule.attr.edition
    if not edition:
        edition = toolchain.default_edition

    crate_name = ctx.rule.attr.name

    crate_root = fetch_crate_root_file(ctx)

    cfgs = []
    for feature in ctx.rule.attr.crate_features:
        cfgs.append("feature=\"" + feature + "\"")
    for flag in ctx.rule.attr.rustc_flags:
        # --cfg flags should be passed as well but as an atomic
        # config, not key/value
        if flag.startswith("--cfg"):
            cfgs.append(flag[6:])

    env = {}
    for dep in ctx.rule.attr.deps:
        if BuildInfo in dep:
            env.update({
                "OUT_DIR": "../" + dep[BuildInfo].out_dir.path,
            })
    env.update(ctx.rule.attr.rustc_env)

    deps = [dep[RustTargetInfo] for dep in ctx.rule.attr.deps if RustTargetInfo in dep]
    deps += [dep[RustTargetInfo] for dep in ctx.rule.attr.proc_macro_deps if RustTargetInfo in dep]
    transitive_deps = depset(
        direct = deps,
        order = "postorder",
        transitive = [dep.transitive_deps for dep in deps],
    )

    return [RustTargetInfo(
        name = crate_name,
        edition = edition,
        cfgs = cfgs,
        root = crate_root,
        env = env,
        deps = deps,
        transitive_deps = transitive_deps,
    )]

rust_project_aspect = aspect(
    attr_aspects = ["deps", "proc_macro_deps"],
    implementation = _rust_project_aspect_impl,
    toolchains = ["@io_bazel_rules_rust//rust:toolchain"],
)

def create_crate(ctx, target, crate_mapping):
    crate = dict()
    crate["name"] = target.name
    crate["edition"] = target.edition
    if target.root.startswith("external"):
        crate["root_module"] = ctx.attr.exec_root + "/" + target.root
        crate["is_workspace_member"] = False
    else:
        crate["root_module"] = "../" + target.root
        crate["is_workspace_member"] = True

    deps = []
    for dep in target.deps:
        deps.append({
            "name": dep.name,
            "crate": crate_mapping["ID-" + dep.root],
        })

    crate["deps"] = deps
    crate["cfg"] = target.cfgs
    crate["env"] = target.env
    return "ID-" + target.root, crate

def _rust_project_impl(ctx):
    output = dict()
    rust_toolchain = find_toolchain(ctx)
    output["sysroot_src"] = ctx.attr.exec_root + "/" + rust_toolchain.rust_lib.label.workspace_root + "/library"
    output["crates"] = []

    crate_mapping = dict()

    idx = 0
    for target in ctx.attr.targets:
        # Add our transitive dependencies
        for dep in target[RustTargetInfo].transitive_deps.to_list():
            crate_id, crate = create_crate(ctx, dep, crate_mapping)
            if crate_id not in crate_mapping:
                crate_mapping[crate_id] = idx
                idx += 1
                output["crates"].append(crate)

        # Add this crate to the crate mapping and output.
        crate_id, crate = create_crate(ctx, target[RustTargetInfo], crate_mapping)
        if crate_id not in crate_mapping:
            crate_mapping[crate_id] = idx
            idx += 1
            output["crates"].append(crate)

    ctx.actions.write(output = ctx.outputs.filename, content = struct(**output).to_json())

rust_analyzer = rule(
    attrs = {
        "targets": attr.label_list(
            aspects = [rust_project_aspect],
            doc = "List of all targets to be included in the index",
        ),
        "exec_root": attr.string(
            mandatory = True,
            doc = "Execution root of Bazel as returned by 'bazel info execution_root'.",
        ),
    },
    outputs = {
        "filename": "rust-project.json",
    },
    implementation = _rust_project_impl,
    toolchains = ["@io_bazel_rules_rust//rust:toolchain"],
)
