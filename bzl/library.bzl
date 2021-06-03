load(
    "@obazl_rules_ocaml//ocaml:rules.bzl",
    "ocaml_library",
    "ocaml_module",
    "ocaml_signature",
)

def sig_module(name, conf, deps, **kw):
    struct = conf.get("mod", name + ".ml")
    sig = conf.get("sig_src", name + "_sig" if conf.get("sig", False) else None)
    all_deps = deps + conf.get("deps", [])
    if sig != None:
        ocaml_signature(
            name = sig,
            src = conf.get("sig_src", name + ".mli"),
            deps = all_deps,
            **kw,
        )
    ocaml_module(
        name = name,
        struct = struct,
        deps = all_deps,
        sig = sig,
        **kw,
    )
    return name

def lib(modules, name = "lib", deps = [], **kw):
    targets = [sig_module(mod_name, conf, deps, **kw) for (mod_name, conf) in modules.items()]
    ocaml_library(
        name = name,
        modules = targets,
        visibility = ["//visibility:public"],
    )

def simple_lib(modules, sig = True, **kw):
    targets = dict([(name, dict(deps = deps, sig = sig)) for (name, deps) in modules.items()])
    return lib(targets, **kw)

def sig(**kw):
    return dict(sig = True, **kw)

def mod(**kw):
    return dict(**kw)
