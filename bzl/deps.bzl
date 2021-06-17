load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def cohttp_deps():
    maybe(
        http_archive,
        "conduit",
        sha256 = "83aeed3712c794529b11248e7dcb097a733536d9121c37551a96450e36eeb9c4",
        strip_prefix = "ocaml-conduit-b428c79ea7cff3c09dd8bfd1435f18947f2e706f",
        urls = [
            "https://github.com/tek/ocaml-conduit/archive/b428c79ea7cff3c09dd8bfd1435f18947f2e706f.tar.gz",
        ],
    )
