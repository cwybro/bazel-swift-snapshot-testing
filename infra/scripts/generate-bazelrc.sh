#!/bin/bash

mkdir -p generated
echo "test --test_env=WORKSPACE_PATH=$(git rev-parse --show-toplevel)" > generated/generated.bazelrc
