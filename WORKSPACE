load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    sha256 = "a647ad9ee6664a78377cf5707331966b6788be09d1fea48045a61bc450c8f1b1",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/releases/download/0.7.0/release.tar.gz",
)

load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

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
    url = "https://github.com/pointfreeco/swift-snapshot-testing/archive/refs/tags/1.10.0.tar.gz",
    sha256 = "c023c85bd6557fc545829c95d977f1ecdb5de76d1cdae59eff809aeed7e80f4c",
    build_file = "swift-snapshot-testing/BUILD",
    strip_prefix = "swift-snapshot-testing-1.10.0"
)

http_archive(
    name = "com_github_kylef_pathkit",
    url = "https://github.com/kylef/PathKit/archive/refs/tags/1.0.1.tar.gz",
    # sha256 = "",
    build_file = "pathkit/BUILD",
    strip_prefix = "PathKit-1.0.1"
)
