#!/bin/bash

prefix=$(cat ./prefix.txt)

suffix=(
1
2
3
)

for n in ${suffix[@]}; do
  host=${prefix}${n}
  echo ---${host}---
  #rsync -rvl $pdir/$fname ${usr}@${host}:${pdir}
  cat ./ip-mac | sed "${n}d" > ./tmp.${n}
  scp ./tmp.${n} root@${host}:/etc/ip-mac
done
