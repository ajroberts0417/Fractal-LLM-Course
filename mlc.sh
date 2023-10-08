#!/bin/bash

# Stop on the first error
set -e

# 1. Download pre-quantized weights. The comamnds below download the int4-quantized Llama2-7B from HuggingFace:
git lfs install && mkdir -p dist/prebuilt
git clone https://huggingface.co/mlc-ai/mlc-chat-Llama-2-7b-chat-hf-q4f16_1 \
                          dist/prebuilt/mlc-chat-Llama-2-7b-chat-hf-q4f16_1

# 2. Download pre-compiled model library. The pre-compiled model library is available as below:
git clone https://github.com/mlc-ai/binary-mlc-llm-libs.git dist/prebuilt/lib


echo "Install Complete."