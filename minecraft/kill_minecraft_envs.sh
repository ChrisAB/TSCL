#!/bin/bash

if [ -n "$2" ]; then
  start_port=$2
else
  start_port=10000
fi
    
for i in `seq 1 $1`;
do
    port=$(($start_port + $i))
    sudo pkill launchClient
done
