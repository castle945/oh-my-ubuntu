#!/bin/bash
# 
# shell 工具插件

function zip_all()
{
    # for file in $(ls -A | sed "s:^:`pwd`/:")
    for file in $(ls)
    do
    sh -c "zip -ry $file.zip $file"
    done
}

function cmake_git_pkg_install()
{
    url=$1
    name=$2
    cd; git clone $url
    cd ${name}; mkdir build;
    cd build && cmake -DCMAKE_BUILD_TYPE=Release ..; make -j8
    sudo make install
    cd; rm -rf ${name}
}
function cmake_targz_pkg_install()
{
    url=$1
    name=$2
    cd; wget -O ${name}.tar.gz $url
    mkdir ${name}; tar -zxvf ${name}.tar.gz -C ${name} --strip-components 1
    cd ${name}; mkdir build;
    cd build && cmake -DCMAKE_BUILD_TYPE=Release ..; make -j8
    sudo make install
    cd; rm -rf ${name} ${name}.tar.gz
}