#!/bin/bash

conda create -n nas python=3.9 -y
source activate nas #source not found err: run ./ not sh

pip install numpy
pip install tensorflow==2.12.0
pip install tflearn==0.5.0

pip uninstall Pillow
pip install Pillow==9.5.0

pip install flask
pip install scikit-image

#install torch
conda install pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.7 -c pytorch -c nvidia

pip install chardet
pip install opencv-python

conda deactivate