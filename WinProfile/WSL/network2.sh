#!/bin/sh

gitconfig="~/.gitconfig"
curlrc="~/.curlrc"
if [ ! -f "$gitconfig" ]; then
    touch "$gitconfig"
fi
if [ ! -f "$curlrc"]; then
    touch "$curlrc"
fi

export WIN_IP=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`
sed -i '/\[http]/,$d' ~/.gitconfig
echo -e '[http]\nproxy=socks5://'${WIN_IP}':7890\n[https]\nproxy=socks5://'${WIN_IP}':7890' >> ~/.gitconfig
sed -i '/socks5.*/d' ~/.curlrc
echo 'socks5='${WIN_IP}':7890' >> ~/.curlrc
export ALL_PROXY=socks5://'${WIN_IP}':7890
export all_proxy=socks5://'${WIN_IP}':7890
echo 'WSL2 代理配置已初始化'
