load(
    "@build_bazel_rules_swift//swift:swift.bzl", 
    "swift_library"
)

swift_library(
    name = "SnapshotTesting",
    module_name = "SnapshotTesting",
    srcs = glob([
        "Sources/**/*.swift",
    ], allow_empty = False),
    visibility = ["//visibility:public"],
)
