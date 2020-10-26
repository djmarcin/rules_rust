load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("//worker:toolchain.bzl", "worker_toolchain")

package(default_visibility = ["//visibility:public"])

exports_files([
    "repositories.bzl",
])

bzl_library(
    name = "rules",
    srcs = glob(["**/*.bzl"]),
)

toolchain_type(name = "toolchain_type")

worker_toolchain(name = "worker_dummy")

toolchain(
    name = "dummy",
    toolchain = ":worker_dummy",
    toolchain_type = ":toolchain_type",
)

load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary", "rust_library")

rust_library(
    name = "rustc_worker",
    srcs = [
        "src/lib.rs",
        "src/worker_protocol.rs",
    ],
    deps = [
        "@io_bazel_rules_rust//proto/raze:protobuf",
    ],
)

rust_binary(
    name = "rustc-worker",
    srcs = ["src/main.rs"],
    deps = [
        ":rustc_worker",
        "@io_bazel_rules_rust//proto/raze:protobuf",
    ],
)

# These toolchains are only registered if workers are enabled in rust_repositories().

worker_toolchain(
    name = "worker_linux_x86_64",
    worker_binary = "@rust_worker_linux_x86_64//file",
)

toolchain(
    name = "linux_x86_64",
    exec_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    toolchain = ":worker_linux_x86_64",
    toolchain_type = ":toolchain_type",
)
