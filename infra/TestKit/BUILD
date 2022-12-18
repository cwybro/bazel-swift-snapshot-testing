load(
    "@build_bazel_rules_swift//swift:swift.bzl", 
    "swift_library"
)

swift_library(
    name = "TestKit",
    module_name = "TestKit",
    srcs = glob([
        "Source/**/*.swift",
    ], allow_empty = False),
    deps = [
        "@com_github_pointfreeco_swift_snapshot_testing//:SnapshotTesting",
        "@com_github_kylef_pathkit//:PathKit",
    ],
    testonly = True,
    visibility = ["//visibility:public"],
)
