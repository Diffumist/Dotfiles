#!/bin/sh

gitconfig="~/.gitconfig"
curlrc="~/.curlrc"
if [ ! -f "$gitconfig" ]; then
    touch "$gitconfig"
fi
if [ ! -f "$curlrc"]; then
    touch "$curlrc"
fi

sed -i '/\[http]/,$d' ~/.gitconfig
echo -e '[http]\nproxy=socks5://127.0.0.1:7890\n[https]\nproxy=socks5://127.0.0.1:7890' >> ~/.gitconfig
sed -i '/socks5.*/d' ~/.curlrc
echo 'socks5=127.0.0.1:7890' >> ~/.curlrc
export ALL_PROXY=socks5://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890
echo 'WSL1 代理配置已初始化'