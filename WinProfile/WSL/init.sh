# 用于 wsl2 网络初始化
export WIN_IP=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`
sed -i '/\[http]/,$d' ~/.gitconfig
echo -e '[http]\nproxy=socks5://'${WIN_IP}':7890\n[https]\nproxy=socks5://'${WIN_IP}':7890' >> ~/.gitconfig
sed -i '/socks5.*/d' ~/.curlrc
echo 'socks5='${WIN_IP}':7890' >> ~/.curlrc
export ALL_PROXY=socks5://'${WIN_IP}':7890
export all_proxy=socks5://'${WIN_IP}':7890
