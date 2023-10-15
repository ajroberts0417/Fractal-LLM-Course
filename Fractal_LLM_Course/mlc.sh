#!/bin/bash

# Stop on the first error
set -e

# 1. setup and activate new mlc-llm mamba environment
mamba create -n mlc-llm python=3.11
mamba activate mlc-llm
echo("NOTE: Ensure that python and pip both point to your new mlc-llm environment. You may need to restart terminal.")
which python
which pip


# 2. Download the CUDA 12.1 mlc-llm wheels
pip install --pre --force-reinstall mlc-ai-nightly-cu121 mlc-chat-nightly-cu121 -f https://mlc.ai/wheels

# 1. Download pre-quantized weights. The comamnds below download the int4-quantized Llama2-7B from HuggingFace:
git lfs install && mkdir -p dist/prebuilt
git clone https://huggingface.co/mlc-ai/mlc-chat-Llama-2-7b-chat-hf-q4f16_1 \
                          dist/prebuilt/mlc-chat-Llama-2-7b-chat-hf-q4f16_1

# 2. Download pre-compiled model library. The pre-compiled model library is available as below:
git clone https://github.com/mlc-ai/binary-mlc-llm-libs.git dist/prebuilt/lib


echo "Install Complete."