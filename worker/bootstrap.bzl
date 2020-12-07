"""
A simplified rust_binary implementation based on cargo so we can compile
the worker binary.
"""

load("@io_bazel_rules_rust//rust:private/rustc.bzl", "get_cc_toolchain", "get_linker_and_args")

def _rewrite_to_unix_path(path):
    drive = path[0]
    return "/" + drive + path[2:].replace("\\", "/")

def _rust_binary_impl(ctx):
    toolchain = ctx.toolchains["@io_bazel_rules_rust//rust:toolchain"]
    output = ctx.actions.declare_file(ctx.label.name + toolchain.binary_ext)
    cache_dir = ctx.actions.declare_directory(ctx.label.name + "_cache")
    target_dir = ctx.actions.declare_directory(ctx.label.name + "_target")
    folder = ctx.files.srcs[0].dirname
    rust_bin = toolchain.cargo.dirname

    # get linker env for building on Windows
    cc_toolchain, feature_configuration = get_cc_toolchain(ctx)
    _, _, link_env = get_linker_and_args(ctx, cc_toolchain, feature_configuration, depset())

    # this is an awful hack to extract the path to MSVC on Windows, so we can inject it
    # into the path after use_default_shell_env has set it up. Without default_shell_env,
    # compilation fails on other platforms because `cc` is not in the path. There is no doubt
    # a better way to handle this.
    path = link_env.get("PATH")
    if path:
        # cc toolchain has placed it at head of path
        msvc_path = path.split(";")[0]
        msvc_path = _rewrite_to_unix_path(msvc_path) + ":"
    else:
        msvc_path = ""

    lib = link_env.get("LIB", "")
    if lib:
        lib = _rewrite_to_unix_path(lib)

    ctx.actions.run_shell(
        inputs = ctx.files.srcs,
        outputs = [output, cache_dir, target_dir],
        command = """\
export RUSTC="$(pwd)/{rustc}"; \
export CARGO="$(pwd)/{cargo}"; \
export OUTPUT="$(pwd)/{output}"; \
export CARGO_HOME="$(pwd)/{cache_dir}"; \
export CARGO_TARGET_DIR="$(pwd)/{target_dir}"; \
export PATH="{msvc_path}$PATH"; \
export LIB="{lib}"; \
cd {folder} && \
"$CARGO" build -q --release && \
mv $CARGO_TARGET_DIR/release/rustc-worker "$OUTPUT" """.format(
            rust_bin = rust_bin,
            folder = folder,
            cargo = toolchain.cargo.path,
            rustc = toolchain.rustc.path,
            output = output.path,
            cache_dir = cache_dir.path,
            target_dir = target_dir.path,
            msvc_path = msvc_path,
            lib = lib,
        ),
        tools = [toolchain.cargo, toolchain.rustc] + toolchain.rust_lib.files.to_list() + toolchain.rustc_lib.files.to_list(),
        use_default_shell_env = True,
        progress_message = "Building rust worker",
    )
    return [
        DefaultInfo(executable = output),
    ]

rust_cargo_binary = rule(
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "_cc_toolchain": attr.label(
            default = "@bazel_tools//tools/cpp:current_cc_toolchain",
        ),
    },
    fragments = ["cpp"],
    host_fragments = ["cpp"],
    executable = True,
    toolchains = [
        "@bazel_tools//tools/cpp:toolchain_type",
        "@io_bazel_rules_rust//rust:toolchain",
    ],
    implementation = _rust_binary_impl,
    doc = "Internal, do not use this.",
)
