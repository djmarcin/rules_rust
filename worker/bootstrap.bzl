"""
A simplified rust_binary implementation based on cargo so we can compile
the worker binary.
"""

def _rust_binary_impl(ctx):
    toolchain = ctx.toolchains["@io_bazel_rules_rust//rust:toolchain"]
    output = ctx.actions.declare_file(ctx.label.name + toolchain.binary_ext)
    cache_dir = ctx.actions.declare_directory(ctx.label.name + "_cache")
    folder = ctx.files.srcs[0].dirname
    rust_bin = toolchain.cargo.dirname

    # + [toolchain.rust_lib, toolchain.rustc_lib]
    ctx.actions.run_shell(
        inputs = ctx.files.srcs,
        outputs = [output, cache_dir],
        #        executable = toolchain.cargo,
        command = """\
export RUSTC="$(pwd)/{rustc}"; \
export CARGO="$(pwd)/{cargo}"; \
export OUTPUT="$(pwd)/{output}"; \
export CARGO_HOME="$(pwd)/{cache_dir}"; \
cd {folder} && \
"$CARGO" build -q --release && \
mv target/release/rustc-worker "$OUTPUT" """.format(
            rust_bin = rust_bin,
            folder = folder,
            cargo = toolchain.cargo.path,
            rustc = toolchain.rustc.path,
            output = output.path,
            cache_dir = cache_dir.path,
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
    executable = True,
    toolchains = [
        "@bazel_tools//tools/cpp:toolchain_type",
        "@io_bazel_rules_rust//rust:toolchain",
    ],
    implementation = _rust_binary_impl,
    doc = "Internal, do not use this.",
)
