#!/bin/bash
# 注意: 脚本仅做顺序记录用，并不保证能直接运行

# FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel
# [可选] 个人 shell 环境
apt update ; apt install -y sudo git openssh-client
cd && git clone https://gitee.com/city945/oh-my-ubuntu.git && bash oh-my-ubuntu/install && rm -rf oh-my-ubuntu

apt update ; apt install -y ffmpeg libsm6 libxext6 git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6

pip install openmim 
mim install mmengine=='0.4.0'


min install 'mmcls>=1.0rc0' # mmcls-1.0.0rc5 mmcv-2.0.0rc4

mim install mmyolo # mmcv-2.0.0rc4 mmdet-3.0.0rc5 mmyolo-0.4.0
pip uninstall mmyolo && git clone https://ghproxy.com/https://github.com/open-mmlab/mmyolo.git -b v0.4.0 && cd mmyolo && pip install -e .
