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
  ssh root@${host} -t "ifconfig"
done
