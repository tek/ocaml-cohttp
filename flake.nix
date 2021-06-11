{
  description = "OCaml: cohttp";

  inputs.obazl.url = github:tek/rules_ocaml;

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
      "ounit"
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
