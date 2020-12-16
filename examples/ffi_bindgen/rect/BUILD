load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//ffi_bindgen:__subpackages__"])

cc_library(
    name = "native_rect",
    srcs = ["rect.c"],
    hdrs = ["rect.h"],
    copts = ["-std=c99", "-Iffi_bindgen"],
    deps = ["//ffi_bindgen/point:native_point"],
)
