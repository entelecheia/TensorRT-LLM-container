#!/usr/bin/env bash

# This script is used to initialize the submodule in the repo.
git submodule update --init --recursive

TRT_GIT_COMMIT=$(cd src/TensorRT-LLM && git rev-parse HEAD)
TRT_LLM_VERSION=$(grep '^__version__' src/TensorRT-LLM/tensorrt_llm/version.py | grep -o '=.*' | tr -d '= "')

echo "IMAGE_VERSION=${TRT_LLM_VERSION}" > .docker/docker.version
