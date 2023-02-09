load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    sha256 = "1e2f40eaee520093343528ac9a4a9180b0500cdd83b1e5e2a95abc8c541686e2",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/releases/download/1.1.0/release.tar.gz",
)

load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "d3afb83e5cb25893c43201824a4361c17012d4db177605d6470bb6a16fac5559",
    strip_prefix = "rules_apple-8c6a419878d24865bbd8c25a0bd5b46df02c5611",
    url = "https://github.com/bazelbuild/rules_apple/archive/8c6a419878d24865bbd8c25a0bd5b46df02c5611.zip",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

http_archive(
    name = "com_github_pointfreeco_swift_snapshot_testing",
    build_file = "swift-snapshot-testing/BUILD",
    sha256 = "c023c85bd6557fc545829c95d977f1ecdb5de76d1cdae59eff809aeed7e80f4c",
    strip_prefix = "swift-snapshot-testing-1.10.0",
    url = "https://github.com/pointfreeco/swift-snapshot-testing/archive/refs/tags/1.10.0.tar.gz",
)

http_archive(
    name = "com_github_kylef_pathkit",
    # sha256 = "",
    build_file = "pathkit/BUILD",
    strip_prefix = "PathKit-1.0.1",
    url = "https://github.com/kylef/PathKit/archive/refs/tags/1.0.1.tar.gz",
)
