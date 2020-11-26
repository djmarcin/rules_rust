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

load("@io_bazel_rules_rust//rust:private/rustc.bzl", "BuildInfo", "CrateInfo")
load("@io_bazel_rules_rust//rust:private/utils.bzl", "find_toolchain")

# We support only these rule kinds.
_rust_rules = [
    "rust_library",
    "rust_binary",
]

RustAnalyzerInfo = provider(
    "RustAnalyzerInfo holds rust crate metadata for targets",
    fields = {
        "crate": "CrateInfo",
        "deps": "List[RustAnalyzerInfo]: direct dependencies",
        "transitive_deps": "List[RustAnalyzerInfo]: transitive closure of dependencies",
        "cfgs": "List[String]: features or other compilation --cfg= settings",
        "env": "Dict{String: String}: Environment variables, used for the `env!` macro",
    },
)

def _rust_analyzer_aspect_impl(target, ctx):
    if CrateInfo not in target:
        return []

    toolchain = find_toolchain(ctx)

    cfgs = []
    for feature in ctx.rule.attr.crate_features:
        cfgs.append("feature=\"" + feature + "\"")
    for flag in ctx.rule.attr.rustc_flags:
        # --cfg flags should be passed as well but as an atomic
        # config, not key/value
        if flag.startswith("--cfg"):
            cfgs.append(flag[6:])

    env = {}

    # If one of our deps is a cargo_build_script, set OUT_DIR.
    for dep in ctx.rule.attr.deps:
        if BuildInfo in dep:
            env.update({
                "OUT_DIR": "../" + dep[BuildInfo].out_dir.path,
            })

    # Add rest of rustc_env
    env.update(ctx.rule.attr.rustc_env)

    deps = [dep[RustAnalyzerInfo] for dep in (ctx.rule.attr.deps + ctx.rule.attr.proc_macro_deps) if RustAnalyzerInfo in dep]
    transitive_deps = depset(direct = deps, order = "postorder", transitive = [dep.transitive_deps for dep in deps])

    return [RustAnalyzerInfo(
        crate = target[CrateInfo],
        cfgs = cfgs,
        env = env,
        deps = deps,
        transitive_deps = transitive_deps,
    )]

rust_analyzer_aspect = aspect(
    attr_aspects = ["deps", "proc_macro_deps"],
    implementation = _rust_analyzer_aspect_impl,
    toolchains = ["@io_bazel_rules_rust//rust:toolchain"],
)

def create_crate(ctx, info, crate_mapping):
    """Creates a crate in the rust-project.json format

    Args:
        ctx: The rule context from which the exec_root can be retrieved
        info: The crate RustAnalyzerInfo for the current crate
        crate_mapping: The mapping of crates to ids for dependency memoization

    Returns:
        Tuple containing this crate's ID and the crate rust-project representation
    """
    crate = dict()
    crate["name"] = info.crate.name
    crate["edition"] = info.crate.edition
    if info.crate.root.path.startswith("external"):
        crate["root_module"] = ctx.attr.exec_root + "/" + info.crate.root.path
        crate["is_workspace_member"] = False
    else:
        crate["root_module"] = "../" + info.crate.root.path
        crate["is_workspace_member"] = True

    deps = []
    for dep in info.deps:
        deps.append({
            "name": dep.crate.name,
            "crate": crate_mapping["ID-" + dep.crate.root.path],
        })

    crate["deps"] = deps
    crate["cfg"] = info.cfgs
    crate["env"] = info.env
    return "ID-" + info.crate.root.path, crate

# This implementation is incomplete because in order to get rustc env vars we
# would need to actually execute the build graph and gather the output of
# cargo_build_script rules. This would require a genrule to actually construct
# the JSON, rather than being able to build it completly in starlark.
# TODO(djmarcin): Run the cargo_build_scripts to gather env vars correctly.
def _rust_project_impl(ctx):
    rust_toolchain = find_toolchain(ctx)
    crate_mapping = dict()

    output = dict()
    output["sysroot_src"] = ctx.attr.exec_root + "/" + rust_toolchain.rust_lib.label.workspace_root + "/rustc-src/library"
    output["crates"] = []

    # Gather all crates and their dependencies into an array.
    # Dependencies are referenced by index, so leaves should come first.
    idx = 0
    for target in ctx.attr.targets:
        if RustAnalyzerInfo not in target:
            continue

        # Add this crate's transitive deps to the crate mapping and output.
        for dep_info in target[RustAnalyzerInfo].transitive_deps.to_list():
            crate_id, crate = create_crate(ctx, dep_info, crate_mapping)
            if crate_id not in crate_mapping:
                crate_mapping[crate_id] = idx
                idx += 1
                output["crates"].append(crate)

        # Add this crate to the crate mapping and output.
        crate_id, crate = create_crate(ctx, target[RustAnalyzerInfo], crate_mapping)
        if crate_id not in crate_mapping:
            crate_mapping[crate_id] = idx
            idx += 1
            output["crates"].append(crate)

    ctx.actions.write(output = ctx.outputs.filename, content = struct(**output).to_json())

rust_analyzer = rule(
    attrs = {
        "targets": attr.label_list(
            aspects = [rust_analyzer_aspect],
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
