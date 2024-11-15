ARG base_image

FROM ${base_image}

# 其他设置
ENV DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN                     \
sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
apt update; apt upgrade -y; apt autoremove          && \
apt install -y sudo openssh-server                  && \
apt install -y ffmpeg libsm6 libxext6 libgl1-mesa-glx libglib2.0-dev && \
rm -rf /var/lib/apt/lists/

# docker libGL.so.1 error

# 新建用户
# ENV USERNAME=bingwen PASSWD=bingwen USERID=1001
# RUN                     \ 
# useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
# echo ${USERNAME}:${PASSWD} | chpasswd

# /bin/sh -c "" add array error
# # RUN for USERNAME in ${USERNAMES[@]}; do useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}  && echo ${USERNAME}:${USERNAME} | chpasswd && ((USERID++)); done

# add user and add to group users
ENV USERNAMES="bingwen cln zhaoyafei zqc rdx zjb city945 ssj zhouqi hhg ghw wjh fw pengleming zwx ybq lj cyt yyp xl zwh zkx liujian fyc zy ryx djb by" USERID=1001
RUN                     \
echo 'for USERNAME in ${USERNAMES[@]}; do ' >> /tmp/adduser.sh && \
echo 'useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}' >> /tmp/adduser.sh  && \
echo 'adduser ${USERNAME} users' >> /tmp/adduser.sh  && \
echo 'echo ${USERNAME}:${USERNAME} | chpasswd && ((USERID++)); done ' >> /tmp/adduser.sh && \
bash /tmp/adduser.sh

ENV ADMIN=city945
RUN                     \
adduser ${ADMIN} sudo   && \
mkdir -p /var/run/sshd

# docker build -t city945/docker:cuda11.8.0-cudnn8-devel-ubuntu22.04 --build-arg base_image="nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04" -f wrapper.Dockerfile .