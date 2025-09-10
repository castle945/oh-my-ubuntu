#!/bin/bash
# 
# 通用终端配置 全局别名 脚本函数 环境变量

################################################################################################
#	
# alias 别名
#  
################################################################################################
# 原生命令简化
alias cp='cp -rp'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias la='ls -A'

# CUI 工具命令简化
alias tnew='tmux new -s '
alias tback='tmux attach -t '
alias tkill='tmux kill-session -t '
alias tree='tree -I .git'
alias zip='zip -ry'

################################################################################################
#	
#  脚本函数
#  
################################################################################################
function echorun {
    echo "$@" && "$@"
}
function gitcpchanges {
    if [ $# -ne 1 ] || ! [ -d ".git" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        printf "Usage:\n\t$0 dest_dir # 请在 git 仓库根路径下运行\n"
        printf "Examples:\n\t$0 .trash/temp/\n"
        return -1
    fi
    local dest_dir=$1

    mkdir -p $dest_dir
    git status --porcelain | grep 'M\|??\|A' | awk '{print $2}' | while read filepath; do
        mkdir -p $dest_dir/$(dirname $filepath)
        echorun cp -rp $filepath $dest_dir/$(dirname $filepath)
    done
}
function gitcpcommits {
    if [ $# -ne 2 ] || ! [ -d ".git" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        printf "Usage:\n\t$0 dest_dir num_commits # 请在 git 仓库根路径下运行，输入目标路径和需要保存的最近提交层数\n"
        printf "Examples:\n\t$0 .trash/temp/\n"
        return -1
    fi
    local dest_dir=$1
    local num_commits=$2
    local cur_work_dir=$(pwd)

    mkdir -p $dest_dir
    abs_dest_dir=$(realpath $dest_dir)
    src_dir=$(pwd)
    tmp_dir=/tmp/$(basename $src_dir)
    cd /tmp && git clone $src_dir/.git
    cd $tmp_dir
    for i in {$num_commits..1}; do
        git reset HEAD^
        cur_dest_dir=$abs_dest_dir/$(printf "commit%02d" $i)
        gitcpchanges $cur_dest_dir
        git reset --hard HEAD
        git clean -fd # 清除未跟踪文件
    done
    echorun rm -rf $tmp_dir
    # gather all commits
    mkdir -p $abs_dest_dir/final
    echorun cp -rp $abs_dest_dir/commit*/{*,.*} $abs_dest_dir/final # only for zsh
    cd $cur_work_dir
}
# 简单实现类似 apt-get 快速获取仓库文件的功能
function fget {
    if [ $# -ne 2 ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then 
        printf "Usage:\n\t$0 /search/dir keyword\n"
        printf "Examples:\n\t$0 /workspace/files/misc *id*\n"
        return -1
    fi
    local search_dir=$1
    find ${search_dir} -maxdepth 6 -iname $2 | fzf | xargs -I file sh -c 'cp -rp file ./'
}
# docker 简化从镜像源拉取和推送
function dockermirrorpull {
    local image=$1
    local prefix="docker-0.unsee.tech/"
    docker pull $prefix$image
    docker tag $prefix$image $image
    docker rmi $prefix$image
}
function dockermirrorpush {
    local image=$1
    local prefix="njust.docker.com/"
    docker tag $image $prefix$image
    docker push $prefix$image
    docker rmi $prefix$image
}

################################################################################################
#	
# 环境变量 与 第三方脚本
#  
################################################################################################
export PATH=$HOME/.local/bin:$PATH

ulimit -c unlimited # 常用于 gdb 调试，确保段错误等都能产生核心转储文件，并且不限制该文件的大小
[[ -x "$(command -v xhost)" ]] && xhost +
