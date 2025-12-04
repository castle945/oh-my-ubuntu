#!/bin/bash
set -o errexit

ws_dir=/workspace
proj_dir=$ws_dir/codevault
projects=(
    Det3D/OpenPCDet 
    Det3D/Det3D/thirdparty/CenterPoint Det3D/Det3D/thirdparty/PillarNet-LTS
    Det3DTrans/OpenPCDetTrans Det3DTrans/OpenPCDetTrans/thirdparty/DTS Det3DTrans/OpenPCDetTrans/thirdparty/ReDB-DA-3Ddet 
    Det3DTrans/OpenPCDetTrans/thirdparty/ST3D Det3DTrans/OpenPCDetTrans/thirdparty/UADA3D
    Misc/filesnippets Misc/oh-my-ubuntu Misc/pyutils4city945 Misc/torchutils4city945
    Occ3D
)


# bash utils
function info {
    echo -e "\033[0;32m$1\033[0m"
}
function error {
    echo -e "\033[0;31mError: $1\033[0m" >&2 # 将错误信息输出到标准错误
    exit 1
}
function echorun {
    echo "$@" && "$@"
}


info "backup git projects"
function push2gitee {
    local proj_name=$(basename $1)
    # 如果本地仓库不存在 gitee 远程仓库地址，则添加
    if ! [[ "$(git remote show)" =~ "gitee" ]]; then
        echorun git remote add gitee git@gitee.com:city945/$proj_name.git
    fi
    # 如果 gitee 远程仓库不存在，则创建
    if ! git ls-remote gitee &> /dev/null; then
        curl -X POST --header 'Content-Type: application/json;charset=UTF-8' 'https://gitee.com/api/v5/user/repos' \
            -d "{
                \"access_token\": \"2c396f8734e59eb7a1b3f311758a9ecf\",
                \"name\": \"$proj_name\",
                \"private\": \"true\"
            }" &> /dev/null
        if ! git ls-remote gitee &> /dev/null; then
            error "create gitee repository $proj_name failed!"
        else
            info  "create gitee repository $proj_name successfully!"
        fi
    fi
    # 推送所有分支和标签到 gitee
    for branch in $(git branch --format='%(refname:short)'); do
        echorun git push gitee $branch -f
    done
    git push gitee --tags -f
}
for proj in "${projects[@]}"; do
    echorun cd $proj_dir/$proj
    if [ ! -d ".git" ]; then
        echo "$proj is not a git project, skip"
        continue
    fi
    push2gitee $proj
    echo
done

info "backup archived files manually"
printf "Examples: \n\taliyunpan login\n\taliyunpan upload *.tgz /archive/backup/codevault\n\taliyunpan ls /archive/backup/codevault\n"