load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//ffi_bindgen:__subpackages__"])

cc_library(
    name = "native_point",
    srcs = ["point.c"],
    hdrs = ["point.h"],
    copts = ["-std=c99"],
)
