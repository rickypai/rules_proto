load("@//:rules.bzl", "proto_compile")
load("@io_bazel_rules_go//proto:def.bzl", _go_proto_library = "go_proto_library")

def go_proto_compile(**kwargs):
    proto_compile(
        plugins = ["//go:go"],
        **kwargs
    )

def grpc_go_proto_compile(**kwargs):
    proto_compile(
        plugins = ["//go:grpc_go"],
        **kwargs
    )

def go_proto_library(**kwargs):
    name = kwargs.get("name")
    importpath = kwargs.get("importpath")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")
    compilers = kwargs.get("compilers")
    if not compilers:
        compilers = ["@io_bazel_rules_go//proto:go"]
    _go_proto_library(
        name = name,
        compilers = compilers,
        importpath = importpath,
        proto = deps[0],
        visibility = visibility,
    )

def grpc_go_proto_library(**kwargs):
    name = kwargs.get("name")
    importpath = kwargs.get("importpath")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")
    compilers = kwargs.get("compilers")
    if not compilers:
        compilers = ["@io_bazel_rules_go//proto:go_grpc"]
    _go_proto_library(
        name = name,
        compilers = compilers,
        importpath = importpath,
        proto = deps[0],
        visibility = visibility,
    )
