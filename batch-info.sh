#!/bin/bash

prefix=$(cat ./prefix.txt)

hosts=(
${prefix}1
${prefix}2
${prefix}3
)

file=ifconfig.tmp
if [[ -f $file ]]; then
  rm -f $file
fi
touch $file
for host in ${hosts[@]}; do
  echo ---${host}---
  #rsync -rvl $pdir/$fname ${usr}@${host}:${pdir}
  ssh root@${host} -t "ifconfig" >> $file
done

file2=lines.tmp
if [[ -f $file2 ]]; then
  rm -f $file2
fi
touch $file2
cat $file | grep -n "enp0s8" > $file2

dest=ip-mac
if [[ -f $dest ]]; then
  rm -f $dest
fi
touch $dest

ip=prefix
if [[ -f $ip ]]; then
  rm -f $ip
fi
touch $ip
