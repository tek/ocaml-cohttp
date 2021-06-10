{
  description = "OCaml: cohttp";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/fbfb79400a08bf754e32b4d4fc3f7d8f8055cf94;
    flake-utils.url = github:numtide/flake-utils;
    obazl.url = github:tek/rules_ocaml;
  };

  outputs = { obazl, ... }:
  let
    extraInputs = p: [
      p.gmp
      p.openssl
    ];

    depsOpam = [
      "angstrom"
      "async"
      "base64"
      "ca-certs"
      "fmt"
      "ipaddr"
      "ipaddr-sexp"
      "jsonm"
      "logs"
      "lwt"
      "lwt_ssl"
      "magic-mime"
      "ppx_deriving"
      "ppx_sexp_conv"
      "ppxlib"
      "re"
      "sexplib"
      "sexplib0"
      "stringext"
      "tls"
    ];

  in obazl.flakes { inherit extraInputs depsOpam; };
}
