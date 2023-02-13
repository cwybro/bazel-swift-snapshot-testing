load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
)

objc_library(
    name = "Host_AppLib",
    srcs = [
        "Source/main.m",
    ],
)

ios_application(
    name = "Host_App",
    testonly = True,
    bundle_id = "com.host.app",
    families = ["iphone"],
    infoplists = ["Source/Info.plist"],
    minimum_os_version = "16.0",
    visibility = ["//visibility:public"],
    deps = [":Host_AppLib"],
)
