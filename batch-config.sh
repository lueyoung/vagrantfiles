#!/bin/bash

prefix=$(cat ./prefix.txt)

hosts=(
${prefix}1
${prefix}2
${prefix}3
)
for host in ${hosts[@]}; do
  echo ---${host}---
  #rsync -rvl $pdir/$fname ${usr}@${host}:${pdir}
  ssh root@${host} -t "systemctl stop ufw && systemctl disable ufw"
  ssh root@${host} -t "arp -f /etc/ip-mac"
  ssh root@${host} -t "echo arp -f /etc/ip-mac > /etc/profile.d/arp.sh"
done
