load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_unit_test",
    "ios_application"
)

objc_library(
    name = "Host_AppLib",
    srcs = [
        "Source/main.m",
    ],
)

ios_application(
    name = "Host_App",
    bundle_id = "com.host.app",
    families = ["iphone"],
    infoplists = ["Source/Info.plist"],
    minimum_os_version = "16.0",
    deps = [":Host_AppLib"],
    testonly = True,
    visibility = ["//visibility:public"],
)
