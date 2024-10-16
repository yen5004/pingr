#!/bin/bash

#Script to allow pinging of an ip address. IP address is hardcoded

IP=192.168.1.1
count=0

while true; do
  if ping $IP -c 1 &>/dev/null; then
    count=$((count + 1))
    echo "$count $IP is up $(date)"
  else
    echo "($date): $IP is down!!!"
  fi
  sleep 61
done
