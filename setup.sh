#!/bin/bash

# First, before running:
# ssh paperspace@184.105.6.127
# git clone https://github.com/enzokro/Fractal-LLM-Course.git

# install mamba
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
# NOTE: after installing mamba, refresh your terminal

# move in to the environment folder
cd Fractal-LLM-Course/Fractal_LLM_Course/lesson_0/envs

# create the base environment
mamba env create -f environment.yml

# activate the environment
mamba activate llm_base

# install the pytorch library
python -m pip install -r reqs_torch.txt

# install the python packages, after activating the env
python -m pip install -r requirements.txt  

# now, we can also install the extra packages to speed up LLMs
python -m pip install -r reqs_optim.txt  