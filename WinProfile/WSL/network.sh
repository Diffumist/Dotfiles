#!/bin/sh

gitconfig=".gitconfig"
curlrc=".curlrc"

if [ ! -f "$gitconfig" ]; then
    touch "$gitconfig"
fi
if [ ! -f "$curlrc" ]; then
    touch "$curlrc"
fi

wslnet1(){
    sed -i '/\[http]/,$d' ~/.gitconfig
    echo -e '[http]\nproxy=socks5://127.0.0.1:'${port}'\n[https]\nproxy=socks5://127.0.0.1:'${port}'' >> ~/.gitconfig
    sed -i '/socks5.*/d' ~/.curlrc
    echo 'socks5=127.0.0.1:'${port}'' >> ~/.curlrc
    export ALL_PROXY=socks5://127.0.0.1:'${port}'
    export all_proxy=socks5://127.0.0.1:'${port}'
}

wslnet2(){
    export WIN_IP=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`
    sed -i '/\[http]/,$d' ~/.gitconfig
    echo -e '[http]\nproxy=socks5://'${WIN_IP}':'${port}'\n[https]\nproxy=socks5://'${WIN_IP}':'${port}'' >> ~/.gitconfig
    sed -i '/socks5.*/d' ~/.curlrc
    echo 'socks5='${WIN_IP}':'${port}'' >> ~/.curlrc
    export ALL_PROXY=socks5://'${WIN_IP}':'${port}'
    export all_proxy=socks5://'${WIN_IP}':'${port}'
}

echo "输入 WSL 版本"
read ver
echo "输入网络端口"
read port
if [ $ver == 1 ]; then
welnet1
elif [ $ver == 2 ]; then
wslnet2
fi


echo 'WSL代理配置已初始化'
curl https://ifconfig.me/