#!/bin/bash
# 
# 用户自启脚本，需设置用户自动登录

# frp
# tmux new -s frpc -d
# tmux send -t frpc " \
# cd /home/city945/.local/share/frp && \
# ./frpc -c frpc.ini \
# " C-m

# disk
# vim /etc/fstab
# sudo mount /dev/sdb /home
# sudo mount /dev/sdc /datasets && \
# sudo mount /dev/sdd /datasets/disk0
