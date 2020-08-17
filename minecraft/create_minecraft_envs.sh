#!/bin/bash

if [ -n "$2" ]; then
  start_port=$2
else
  start_port=10000
fi

for i in `seq 1 $1`;
do
    port=$(($start_port + $i))
    sudo ./../../Malmo-install/Malmo-0.37.0-Linux-Ubuntu-18.04-64bit_withBoost_Python3.6/Minecraft/launchClient.sh -port $port
done
