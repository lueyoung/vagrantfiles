#!/bin/bash

hosts=(
192.168.31.241
192.168.31.242
192.168.31.243
)
for host in ${hosts[@]}; do
  echo ---${host}---
  #rsync -rvl $pdir/$fname ${usr}@${host}:${pdir}
  ./auto-cp-ssh-id.sh root 9ol.8ik, $host
done
