load(
    "@build_bazel_rules_swift//swift:swift.bzl", 
    "swift_library"
)

swift_library(
    name = "PathKit",
    module_name = "PathKit",
    srcs = glob([
        "Sources/**/*.swift",
    ], allow_empty = False),
    visibility = ["//visibility:public"],
)
