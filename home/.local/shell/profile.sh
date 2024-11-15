#!/bin/bash
# 
# 通用终端配置 全局别名 脚本函数 环境变量

################################################################################################
#	
# alias 别名
#  
################################################################################################
# 原生命令简化
alias b='cd -'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias la='ls -A'

# # CUI工具命令简化
alias tnew='tmux new -s '
alias tback='tmux attach -t '
alias tkill='tmux kill-session -t '
alias tree='tree -I .git'
alias num-files="ls -lR | grep '^-' | wc -l" # 当前目录下非隐藏文件个数

################################################################################################
#	
#  脚本函数
#  
################################################################################################
# 清除工作空间下的指定名称的目录
function clean_trash()
{
    if [ $# -lt 1 ]; then 
    echo "usage: clean_trash /list/of/dirs\nexample: clean_trash build"
    return -1
    fi

    for trash in $*
    do 
    find -name $trash -type d | xargs -I dir sh -c "rm -rf dir;echo dir"
    done 
}

# 简单实现类似apt-get快速获取仓库文件的功能 #! 直接alias不能用$*获取命令参数
function fget() 
{
    if [ $# -lt 2 ]; then 
        echo "usage: fget /search/dir keyword \nexample: fget ~/work install_*"
        return -1
    fi
    search_dir=$1

    find ${search_dir} -maxdepth 6 -iname $2 | fzf | xargs -I file sh -c 'cp -r file ./'
}
function fmv() 
{
    if [ $# -lt 2 ]; then 
        echo "usage: fmv /search/dir keyword \nexample: fget ~/work install_*"
        return -1
    fi
    search_dir=$1

    find ${search_dir} -maxdepth 6 -iname $2 | fzf | xargs -I file sh -c 'mv file ./'
}

################################################################################################
#	
# 环境变量 与 第三方脚本
#  
################################################################################################
export PATH=$HOME/.local/bin:$PATH

ulimit -c unlimited
[[ -x "$(command -v xhost)" ]] && xhost +
