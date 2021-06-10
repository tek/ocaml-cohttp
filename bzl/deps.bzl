load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def cohttp_deps():
    maybe(
        http_archive,
        "conduit",
        sha256 = "fd13c5b5594f3dff3393eecefa1f2dd981d8519586243fe6625ff234ae88773e",
        strip_prefix = "ocaml-conduit-6a3210bc88b26d8d1e75a7f75ec1a8cd5f6870b9",
        urls = [
            "https://github.com/tek/ocaml-conduit/archive/6a3210bc88b26d8d1e75a7f75ec1a8cd5f6870b9.tar.gz",
        ],
    )
