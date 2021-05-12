#!/bin/sh

iptables -t nat -N TP-TCP
iptables -t nat -A TP-TCP -m owner --gid-owner 850 -j RETURN
iptables -t nat -A TP-TCP -d 0.0.0.0/8 -j RETURN
iptables -t nat -A TP-TCP -d 127.0.0.0/8 -j RETURN
iptables -t nat -A TP-TCP -d 10.0.0.0/8 -j RETURN
iptables -t nat -A TP-TCP -d 224.0.0.0/4 -j RETURN
iptables -t nat -A TP-TCP -d 240.0.0.0/4 -j RETURN
iptables -t nat -A TP-TCP -d 172.16.0.0/12 -j RETURN
iptables -t nat -A TP-TCP -d 192.168.0.0/16 -j RETURN
iptables -t nat -A TP-TCP -p tcp -j REDIRECT --to-ports 7892
iptables -t nat -A OUTPUT -p tcp -j TP-TCP
iptables-save -f /etc/iptables/iptables.rules
systemctl enable iptables.service

