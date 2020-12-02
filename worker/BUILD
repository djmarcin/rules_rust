load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("//worker:toolchain.bzl", "worker_toolchain")
load(":bootstrap.bzl", "rust_cargo_binary")

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

rust_cargo_binary(
    name = "rustc-worker",
    srcs = [
        "main.rs",
        "Cargo.toml",
        "Cargo.lock",
    ] + glob(["lib/*.rs"]),
)

worker_toolchain(
    name = "worker_toolchain",
    worker_binary = ":rustc-worker",
)

toolchain(
    name = "worker",
    toolchain = ":worker_toolchain",
    toolchain_type = ":toolchain_type",
)
