"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def rules_rust_examples_criterion_bench_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//criterion_bench/raze/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__autocfg__1_0_1",
        url = "https://crates.io/api/v1/crates/autocfg/1.0.1/download",
        type = "tar.gz",
        strip_prefix = "autocfg-1.0.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.autocfg-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__bitflags__1_2_1",
        url = "https://crates.io/api/v1/crates/bitflags/1.2.1/download",
        type = "tar.gz",
        strip_prefix = "bitflags-1.2.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.bitflags-1.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__bstr__0_2_14",
        url = "https://crates.io/api/v1/crates/bstr/0.2.14/download",
        type = "tar.gz",
        strip_prefix = "bstr-0.2.14",
        build_file = Label("//criterion_bench/raze/remote:BUILD.bstr-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__bumpalo__3_4_0",
        url = "https://crates.io/api/v1/crates/bumpalo/3.4.0/download",
        type = "tar.gz",
        strip_prefix = "bumpalo-3.4.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.bumpalo-3.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__byteorder__1_3_4",
        url = "https://crates.io/api/v1/crates/byteorder/1.3.4/download",
        type = "tar.gz",
        strip_prefix = "byteorder-1.3.4",
        build_file = Label("//criterion_bench/raze/remote:BUILD.byteorder-1.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__cast__0_2_3",
        url = "https://crates.io/api/v1/crates/cast/0.2.3/download",
        type = "tar.gz",
        strip_prefix = "cast-0.2.3",
        build_file = Label("//criterion_bench/raze/remote:BUILD.cast-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__cfg_if__0_1_10",
        url = "https://crates.io/api/v1/crates/cfg-if/0.1.10/download",
        type = "tar.gz",
        strip_prefix = "cfg-if-0.1.10",
        build_file = Label("//criterion_bench/raze/remote:BUILD.cfg-if-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__clap__2_33_3",
        url = "https://crates.io/api/v1/crates/clap/2.33.3/download",
        type = "tar.gz",
        strip_prefix = "clap-2.33.3",
        build_file = Label("//criterion_bench/raze/remote:BUILD.clap-2.33.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__const_fn__0_4_4",
        url = "https://crates.io/api/v1/crates/const_fn/0.4.4/download",
        type = "tar.gz",
        strip_prefix = "const_fn-0.4.4",
        build_file = Label("//criterion_bench/raze/remote:BUILD.const_fn-0.4.4.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__criterion__0_3_3",
        url = "https://crates.io/api/v1/crates/criterion/0.3.3/download",
        type = "tar.gz",
        strip_prefix = "criterion-0.3.3",
        build_file = Label("//criterion_bench/raze/remote:BUILD.criterion-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__criterion_plot__0_4_3",
        url = "https://crates.io/api/v1/crates/criterion-plot/0.4.3/download",
        type = "tar.gz",
        strip_prefix = "criterion-plot-0.4.3",
        build_file = Label("//criterion_bench/raze/remote:BUILD.criterion-plot-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__crossbeam_channel__0_5_0",
        url = "https://crates.io/api/v1/crates/crossbeam-channel/0.5.0/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-channel-0.5.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.crossbeam-channel-0.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__crossbeam_deque__0_8_0",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.8.0/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-deque-0.8.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.crossbeam-deque-0.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__crossbeam_epoch__0_9_1",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.9.1/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-epoch-0.9.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.crossbeam-epoch-0.9.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__crossbeam_utils__0_8_1",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.8.1/download",
        type = "tar.gz",
        strip_prefix = "crossbeam-utils-0.8.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.crossbeam-utils-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__csv__1_1_5",
        url = "https://crates.io/api/v1/crates/csv/1.1.5/download",
        type = "tar.gz",
        strip_prefix = "csv-1.1.5",
        build_file = Label("//criterion_bench/raze/remote:BUILD.csv-1.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__csv_core__0_1_10",
        url = "https://crates.io/api/v1/crates/csv-core/0.1.10/download",
        type = "tar.gz",
        strip_prefix = "csv-core-0.1.10",
        build_file = Label("//criterion_bench/raze/remote:BUILD.csv-core-0.1.10.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        strip_prefix = "either-1.6.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__half__1_6_0",
        url = "https://crates.io/api/v1/crates/half/1.6.0/download",
        type = "tar.gz",
        strip_prefix = "half-1.6.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.half-1.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__hermit_abi__0_1_17",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.17/download",
        type = "tar.gz",
        strip_prefix = "hermit-abi-0.1.17",
        build_file = Label("//criterion_bench/raze/remote:BUILD.hermit-abi-0.1.17.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__itertools__0_9_0",
        url = "https://crates.io/api/v1/crates/itertools/0.9.0/download",
        type = "tar.gz",
        strip_prefix = "itertools-0.9.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.itertools-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__itoa__0_4_6",
        url = "https://crates.io/api/v1/crates/itoa/0.4.6/download",
        type = "tar.gz",
        strip_prefix = "itoa-0.4.6",
        build_file = Label("//criterion_bench/raze/remote:BUILD.itoa-0.4.6.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__js_sys__0_3_46",
        url = "https://crates.io/api/v1/crates/js-sys/0.3.46/download",
        type = "tar.gz",
        strip_prefix = "js-sys-0.3.46",
        build_file = Label("//criterion_bench/raze/remote:BUILD.js-sys-0.3.46.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__libc__0_2_81",
        url = "https://crates.io/api/v1/crates/libc/0.2.81/download",
        type = "tar.gz",
        strip_prefix = "libc-0.2.81",
        build_file = Label("//criterion_bench/raze/remote:BUILD.libc-0.2.81.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__log__0_4_11",
        url = "https://crates.io/api/v1/crates/log/0.4.11/download",
        type = "tar.gz",
        strip_prefix = "log-0.4.11",
        build_file = Label("//criterion_bench/raze/remote:BUILD.log-0.4.11.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__memchr__2_3_4",
        url = "https://crates.io/api/v1/crates/memchr/2.3.4/download",
        type = "tar.gz",
        strip_prefix = "memchr-2.3.4",
        build_file = Label("//criterion_bench/raze/remote:BUILD.memchr-2.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__memoffset__0_6_1",
        url = "https://crates.io/api/v1/crates/memoffset/0.6.1/download",
        type = "tar.gz",
        strip_prefix = "memoffset-0.6.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.memoffset-0.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__num_traits__0_2_14",
        url = "https://crates.io/api/v1/crates/num-traits/0.2.14/download",
        type = "tar.gz",
        strip_prefix = "num-traits-0.2.14",
        build_file = Label("//criterion_bench/raze/remote:BUILD.num-traits-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__num_cpus__1_13_0",
        url = "https://crates.io/api/v1/crates/num_cpus/1.13.0/download",
        type = "tar.gz",
        strip_prefix = "num_cpus-1.13.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.num_cpus-1.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__oorandom__11_1_3",
        url = "https://crates.io/api/v1/crates/oorandom/11.1.3/download",
        type = "tar.gz",
        strip_prefix = "oorandom-11.1.3",
        build_file = Label("//criterion_bench/raze/remote:BUILD.oorandom-11.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__plotters__0_2_15",
        url = "https://crates.io/api/v1/crates/plotters/0.2.15/download",
        type = "tar.gz",
        strip_prefix = "plotters-0.2.15",
        build_file = Label("//criterion_bench/raze/remote:BUILD.plotters-0.2.15.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__proc_macro2__1_0_24",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.24/download",
        type = "tar.gz",
        strip_prefix = "proc-macro2-1.0.24",
        build_file = Label("//criterion_bench/raze/remote:BUILD.proc-macro2-1.0.24.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__quote__1_0_7",
        url = "https://crates.io/api/v1/crates/quote/1.0.7/download",
        type = "tar.gz",
        strip_prefix = "quote-1.0.7",
        build_file = Label("//criterion_bench/raze/remote:BUILD.quote-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__rayon__1_5_0",
        url = "https://crates.io/api/v1/crates/rayon/1.5.0/download",
        type = "tar.gz",
        strip_prefix = "rayon-1.5.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.rayon-1.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__rayon_core__1_9_0",
        url = "https://crates.io/api/v1/crates/rayon-core/1.9.0/download",
        type = "tar.gz",
        strip_prefix = "rayon-core-1.9.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.rayon-core-1.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__regex__1_4_2",
        url = "https://crates.io/api/v1/crates/regex/1.4.2/download",
        type = "tar.gz",
        strip_prefix = "regex-1.4.2",
        build_file = Label("//criterion_bench/raze/remote:BUILD.regex-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__regex_automata__0_1_9",
        url = "https://crates.io/api/v1/crates/regex-automata/0.1.9/download",
        type = "tar.gz",
        strip_prefix = "regex-automata-0.1.9",
        build_file = Label("//criterion_bench/raze/remote:BUILD.regex-automata-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__regex_syntax__0_6_21",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.6.21/download",
        type = "tar.gz",
        strip_prefix = "regex-syntax-0.6.21",
        build_file = Label("//criterion_bench/raze/remote:BUILD.regex-syntax-0.6.21.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__rustc_version__0_2_3",
        url = "https://crates.io/api/v1/crates/rustc_version/0.2.3/download",
        type = "tar.gz",
        strip_prefix = "rustc_version-0.2.3",
        build_file = Label("//criterion_bench/raze/remote:BUILD.rustc_version-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__ryu__1_0_5",
        url = "https://crates.io/api/v1/crates/ryu/1.0.5/download",
        type = "tar.gz",
        strip_prefix = "ryu-1.0.5",
        build_file = Label("//criterion_bench/raze/remote:BUILD.ryu-1.0.5.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__same_file__1_0_6",
        url = "https://crates.io/api/v1/crates/same-file/1.0.6/download",
        type = "tar.gz",
        strip_prefix = "same-file-1.0.6",
        build_file = Label("//criterion_bench/raze/remote:BUILD.same-file-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__semver__0_9_0",
        url = "https://crates.io/api/v1/crates/semver/0.9.0/download",
        type = "tar.gz",
        strip_prefix = "semver-0.9.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.semver-0.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__semver_parser__0_7_0",
        url = "https://crates.io/api/v1/crates/semver-parser/0.7.0/download",
        type = "tar.gz",
        strip_prefix = "semver-parser-0.7.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.semver-parser-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__serde__1_0_118",
        url = "https://crates.io/api/v1/crates/serde/1.0.118/download",
        type = "tar.gz",
        strip_prefix = "serde-1.0.118",
        build_file = Label("//criterion_bench/raze/remote:BUILD.serde-1.0.118.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__serde_cbor__0_11_1",
        url = "https://crates.io/api/v1/crates/serde_cbor/0.11.1/download",
        type = "tar.gz",
        strip_prefix = "serde_cbor-0.11.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.serde_cbor-0.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__serde_derive__1_0_118",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.118/download",
        type = "tar.gz",
        strip_prefix = "serde_derive-1.0.118",
        build_file = Label("//criterion_bench/raze/remote:BUILD.serde_derive-1.0.118.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__serde_json__1_0_60",
        url = "https://crates.io/api/v1/crates/serde_json/1.0.60/download",
        type = "tar.gz",
        strip_prefix = "serde_json-1.0.60",
        build_file = Label("//criterion_bench/raze/remote:BUILD.serde_json-1.0.60.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__syn__1_0_54",
        url = "https://crates.io/api/v1/crates/syn/1.0.54/download",
        type = "tar.gz",
        strip_prefix = "syn-1.0.54",
        build_file = Label("//criterion_bench/raze/remote:BUILD.syn-1.0.54.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__textwrap__0_11_0",
        url = "https://crates.io/api/v1/crates/textwrap/0.11.0/download",
        type = "tar.gz",
        strip_prefix = "textwrap-0.11.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.textwrap-0.11.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__tinytemplate__1_1_0",
        url = "https://crates.io/api/v1/crates/tinytemplate/1.1.0/download",
        type = "tar.gz",
        strip_prefix = "tinytemplate-1.1.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.tinytemplate-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__unicode_width__0_1_8",
        url = "https://crates.io/api/v1/crates/unicode-width/0.1.8/download",
        type = "tar.gz",
        strip_prefix = "unicode-width-0.1.8",
        build_file = Label("//criterion_bench/raze/remote:BUILD.unicode-width-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__unicode_xid__0_2_1",
        url = "https://crates.io/api/v1/crates/unicode-xid/0.2.1/download",
        type = "tar.gz",
        strip_prefix = "unicode-xid-0.2.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.unicode-xid-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__walkdir__2_3_1",
        url = "https://crates.io/api/v1/crates/walkdir/2.3.1/download",
        type = "tar.gz",
        strip_prefix = "walkdir-2.3.1",
        build_file = Label("//criterion_bench/raze/remote:BUILD.walkdir-2.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__wasm_bindgen__0_2_69",
        url = "https://crates.io/api/v1/crates/wasm-bindgen/0.2.69/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-0.2.69",
        build_file = Label("//criterion_bench/raze/remote:BUILD.wasm-bindgen-0.2.69.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__wasm_bindgen_backend__0_2_69",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-backend/0.2.69/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-backend-0.2.69",
        build_file = Label("//criterion_bench/raze/remote:BUILD.wasm-bindgen-backend-0.2.69.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__wasm_bindgen_macro__0_2_69",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro/0.2.69/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-macro-0.2.69",
        build_file = Label("//criterion_bench/raze/remote:BUILD.wasm-bindgen-macro-0.2.69.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__wasm_bindgen_macro_support__0_2_69",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro-support/0.2.69/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-macro-support-0.2.69",
        build_file = Label("//criterion_bench/raze/remote:BUILD.wasm-bindgen-macro-support-0.2.69.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__wasm_bindgen_shared__0_2_69",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-shared/0.2.69/download",
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-shared-0.2.69",
        build_file = Label("//criterion_bench/raze/remote:BUILD.wasm-bindgen-shared-0.2.69.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__web_sys__0_3_46",
        url = "https://crates.io/api/v1/crates/web-sys/0.3.46/download",
        type = "tar.gz",
        strip_prefix = "web-sys-0.3.46",
        build_file = Label("//criterion_bench/raze/remote:BUILD.web-sys-0.3.46.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//criterion_bench/raze/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//criterion_bench/raze/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "rules_rust_examples_criterion_bench__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//criterion_bench/raze/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )
