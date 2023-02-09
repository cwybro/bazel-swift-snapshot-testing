# bazel-swift-snapshot-testing

This repository contains an exploration of snapshot testing strategies for Swift + Bazel projects, using the [pointfreeco/swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing) library.

## Setup
> ⚠️ This is invoked automatically during `make project`
```bash
make setup
```

### Open Xcode Project
```bash
make project
```

## Caveats
Listed below are a number of caveats required for the current setup:
- `WORKSPACE_PATH` [is injected](src/Example/BUILD) into the Bazel test target `env`
    - This variable is used to provide a path to the local git repository to store newly-generated snapshot artifacts
- `TARGET_NAME` [is injected](src/Example/BUILD) into the Bazel test target `env`
    - This variable is used to provide a target-specific path component to build the AssertSnapshot file path
- `--spawn_strategy=standalone` is provided in the [.bazelrc](.bazelrc) for `test` invocations
    - This flag is used to ensure that snapshot artifacts produced by [AssertSnapshot.swift](infra/TestKit/Source/AssertSnapshot.swift) are not generated in a sandbox, so they can be written to the local git repository
