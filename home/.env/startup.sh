#!/bin/bash
#
# 用户自启脚本，需设置用户自动登录

# frp
# tmux new -s frpc -d
# tmux send -t frpc " \
# cd /home/city945/.local/share/frp && \
# ./frpc -c frpc.ini \
# " C-m

# code-server
# tmux new -s vscode -d
# tmux send -t vscode " \
# code-server
# " C-m

# # novnc
# # for multi screen, first use xrandr --listactivemonitors | awk -- 'BEGIN { getline  } { gsub(/\/[[:digit:]]+/,"",$3) ; print $3  }' to get screen info, eg 1920x1080+0+0
# # for sigle screen, just without -clip like: x11vnc -rfbauth ~/.vnc/passwd -autoport -nopw -bg -xkb -ncache -ncache_cr -quiet -forever -shared -localhost
# x11vnc -rfbauth ~/.vnc/passwd -clip 1920x1080+0+0 -autoport -nopw -bg -xkb -ncache -ncache_cr -quiet -forever -shared -localhost
# # x11vnc -rfbauth ~/.vnc/passwd -clip 1920x1080+1920+0 -autoport -nopw -bg -xkb -ncache -ncache_cr -quiet -forever -shared -localhost
# # /usr/share/novnc/utils/launch.sh --listen *:8082 --vnc localhost:5901 & \
# tmux new -s novnc -d
# tmux send -t novnc " \
# /usr/share/novnc/utils/launch.sh --listen *:8081 --vnc localhost:5900
# " C-m

# pu4c
# tmux new -s pu4c -d
# tmux split-window -h -t pu4c:0
# tmux send -t pu4c:0.0 "ssh amax4090 -R 30570:localhost:30570 -o ServerAliveInterval=120 -o ServerAliveCountMax=15" C-m
# tmux send -t pu4c:0.1 "python -c 'import pu4c; pu4c.common.app.start_rpc_server()'" C-m