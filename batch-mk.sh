#!/bin/bash

set -e

INTERFACES="enp132s0f1 ens9f0 ens4f0 enp132s0f1 enp132s0f1 enp132s0f1"
HOSTS="192.168.0.15"
VAGRANTFILE=./Vagrantfile
DEST="/home/young/vms/vm-1"

for i in $(seq -s ' ' 1 6); do
  INTERFACE=$(echo $INTERFACES | awk -F ' ' -v j=$i '{print $j}')
  FILE="${VAGRANTFILE}.${i}"
  cp $VAGRANTFILE $FILE
  sed -i "s/i = \"1\"/i = \"$i\"/g" $FILE
  sed -i "s/INTERFACE = \"eno1\"/INTERFACE = \"$INTERFACE\"/g" $FILE
  
  HOST="${HOSTS}$i"
  ansible $HOST -m copy -a "src=./$FILE dest=$DEST/$VAGRANTFILE"
  ansible $HOST -m shell -a "cd $DEST && vagrant up"
done
