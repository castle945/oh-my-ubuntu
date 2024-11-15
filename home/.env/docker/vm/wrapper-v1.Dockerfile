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

# 新建普通用户
# ENV USERNAME=admin PASSWD=admin USERID=1000
# RUN                     \ 
# useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
# adduser ${USERNAME} sudo                                            && \
# echo ${USERNAME}:${PASSWD} | chpasswd  

ENV USERNAME=bingwen PASSWD=bingwen USERID=1001
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd                         

ENV USERNAME=cln PASSWD=cln USERID=1002
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=zhaoyafei PASSWD=zhaoyafei USERID=1003
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=zqc PASSWD=zqc USERID=1004
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=rdx PASSWD=rdx USERID=1005
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=zjb PASSWD=zjb USERID=1006
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=city945 PASSWD=city945 USERID=1007
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
adduser ${USERNAME} sudo                                            && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=ssj PASSWD=ssj USERID=1008
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=zhouqi PASSWD=zhouqi USERID=1009
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=hhg PASSWD=hhg USERID=1010
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=ghw PASSWD=ghw USERID=1011
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=wjh PASSWD=wjh USERID=1012
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=fw PASSWD=fw USERID=1013
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=pengleming PASSWD=pengleming USERID=1014
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=zwx PASSWD=zwx USERID=1015
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=ybq PASSWD=ybq USERID=1016
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=lj PASSWD=lj USERID=1017
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=cyt PASSWD=cyt USERID=1018
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=yyp PASSWD=yyp USERID=1019
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=xl PASSWD=xl USERID=1020
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=zwh PASSWD=zwh USERID=1021
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd               

ENV USERNAME=zkx PASSWD=zkx USERID=1022
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd        

ENV USERNAME=liujian PASSWD=liujian USERID=1023
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd        

ENV USERNAME=fyc PASSWD=fyc USERID=1024
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd       

ENV USERNAME=zy PASSWD=zy USERID=1025
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd       

ENV USERNAME=ryx PASSWD=ryx USERID=1026
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd       

ENV USERNAME=djb PASSWD=djb USERID=1027
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd   

ENV USERNAME=by PASSWD=by USERID=1028
RUN                     \ 
useradd --create-home --no-log-init --shell /bin/bash -u ${USERID} ${USERNAME}   && \
echo ${USERNAME}:${PASSWD} | chpasswd  

RUN                     \
mkdir -p /var/run/sshd

      


# docker build -t city945/docker:cuda11.8.0-cudnn8-devel-ubuntu22.04 --build-arg base_image="nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04" -f wrapper.Dockerfile .
