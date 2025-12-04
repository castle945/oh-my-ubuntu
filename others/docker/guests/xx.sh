#!/usr/bin/env bash
# 用法: (1) 手动编辑参数再 bash xx.sh (2) 命令行指定参数如 CONTAINER_NAME=test bash xx.sh
USER_NAME=${USER_NAME:-xx}              # 用户
CONTAINER_NAME=${CONTAINER_NAME:-xx01}  # 容器名，任意命名
SSH_PORT=${SSH_PORT:-23101}             # 23 届 1 人员编号 01 号容器

docker run -itd --ipc=host --network=host --runtime=nvidia \
    -v /dataset:/datasets -v /home/guests/${USER_NAME}:/root \
    --gpus '"device=0,1"' \
    --name ${CONTAINER_NAME} \
    pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel \
    bash -c "apt update ; apt install -y openssh-server ; \
             echo 'root:root' | chpasswd ; \
             mkdir -p /var/run/sshd ; \
             echo 'Port ${SSH_PORT}' >> /etc/ssh/sshd_config ; \
             echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config ; \
             /usr/sbin/sshd -D"
