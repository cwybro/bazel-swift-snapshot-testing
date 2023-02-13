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
    "@build_bazel_rules_apple//apple/testing/default_runner:ios_xctestrun_runner.bzl",
    "ios_xctestrun_runner",
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

filegroup(
    name = "Example_UnitTestsSources",
    srcs = glob(
        [
            "Test/**/*.swift",
        ],
        allow_empty = False,
    ),
)

swift_library(
    name = "Example_AppTestsLib",
    testonly = True,
    srcs = [":Example_UnitTestsSources"],
    module_name = "Example_AppTests",
    visibility = ["//visibility:private"],
    deps = [
        ":Example",
        "//infra/TestKit",
    ],
)

swift_library(
    name = "Example_LibraryTestsLib",
    testonly = True,
    srcs = [":Example_UnitTestsSources"],
    module_name = "Example_LibraryTests",
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

ios_xctestrun_runner(
    name = "new_test_runner",
    device_type = "iPhone 8",
    os_version = "16.0",
    visibility = ["//visibility:public"],
)

ios_unit_test(
    name = "Example_AppTests",
    data = glob([
        "TestResources/Example_AppTests/**/*",
    ]),
    env = {
        "TARGET_NAME": "Example_AppTests",
        "WORKSPACE_PATH": "/Users/connorwybranowski/Documents/GitHub/bazel-swift-snapshot-testing",
    },
    minimum_os_version = "16.0",
    runner = ":new_test_runner",
    test_host = "//infra/HostApp:Host_App",
    deps = [
        ":Example_AppTestsLib",
    ],
)

ios_unit_test(
    name = "Example_LibraryTests",
    data = glob([
        "TestResources/Example_LibraryTests/**/*",
    ]),
    env = {
        "TARGET_NAME": "Example_LibraryTests",
        "WORKSPACE_PATH": "/Users/connorwybranowski/Documents/GitHub/bazel-swift-snapshot-testing",
    },
    minimum_os_version = "16.0",
    runner = ":new_test_runner",
    deps = [
        ":Example_LibraryTestsLib",
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
