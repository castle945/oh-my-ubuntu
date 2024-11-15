#!/bin/bash
# 
# 用户自启脚本，需设置用户自动登录

# # frp
# tmux new -s frpc -d
# tmux send -t frpc " \
# cd /home/city945/.local/share/frp && \
# ./frpc -c frpc.ini \
# " C-m

# # code-server
# tmux new -s vscode -d
# tmux send -t vscode " \
# code-server
# " C-m