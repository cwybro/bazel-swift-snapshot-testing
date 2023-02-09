load(
    "@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)
load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_unit_test",
)
load(
    "@build_bazel_rules_apple//apple/testing/default_runner:ios_test_runner.bzl",
    "ios_test_runner",
)
load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:defs.bzl",
    "xcodeproj",
)

# ==========
# SOURCE
# ==========

swift_library(
    name = "Example",
    srcs = glob(
        [
            "Source/**/*.swift",
        ],
        allow_empty = False,
    ),
    module_name = "Example",
    visibility = ["//visibility:private"],
)

swift_library(
    name = "Example_UnitTests",
    testonly = True,
    srcs = glob(
        [
            "Test/**/*.swift",
        ],
        allow_empty = False,
    ),
    module_name = "Example_UnitTests",
    visibility = ["//visibility:private"],
    deps = [
        ":Example",
        "//infra/TestKit",
    ],
)

# ==========
# TESTS
# ==========

ios_test_runner(
    name = "ios_x86_64_sim_runner",
    device_type = "iPhone 8",
)

ios_unit_test(
    name = "Example_AppTests",
    data = glob([
        "TestResources/Example_AppTests/**/*",
    ]),
    minimum_os_version = "16.0",
    runner = ":ios_x86_64_sim_runner",
    test_host = "//infra/HostApp:Host_App",
    deps = [
        ":Example_UnitTests",
    ],
)

ios_unit_test(
    name = "Example_LibraryTests",
    data = glob([
        "TestResources/Example_LibraryTests/**/*",
    ]),
    minimum_os_version = "16.0",
    runner = ":ios_x86_64_sim_runner",
    deps = [
        ":Example_UnitTests",
    ],
)

# ==========
# PROJECTS
# ==========

xcodeproj(
    name = "Example_Project",
    project_name = "Example_Project",
    tags = ["manual"],
    top_level_targets = [
        ":Example_AppTests",
        ":Example_LibraryTests",
    ],
)
