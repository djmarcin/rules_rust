load("@io_bazel_rules_rust//bindgen:bindgen.bzl", "rust_bindgen_library","rust_bindgen")

package(default_visibility = ["//ffi_bindgen:__subpackages__"])

rust_bindgen(
    name = "native_rect_bindgen",
    header = "//ffi_bindgen/rect:rect.h",
    cc_lib = "//ffi_bindgen/rect:native_rect",
    # bindgen_flags = [
    #     "--whitelist-type=Matrix",
    # ],
)
