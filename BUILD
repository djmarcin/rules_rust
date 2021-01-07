load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@io_bazel_rules_rust//rust:private/rustc.bzl", "error_format", "extra_codegen")

bzl_library(
    name = "rules",
    srcs = [
        ":workspace.bzl",
    ],
    visibility = ["//visibility:public"],
)

# This setting may be changed from the command line to generate machine readable errors.
error_format(
    name = "error_format",
    build_setting_default = "human",
    visibility = ["//visibility:public"],
)

# Enables LTO across the build
extra_codegen(
    name = "extra_codegen",
    build_setting_default = [],
    visibility = ["//visibility:public"],
)
