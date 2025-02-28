#!/bin/bash

# Array of IP addresses and their names
declare -A IP_NAMES
IP_NAMES=(
  ["192.168.30.2"]="Gateway"
  ["192.168.30.132"]="Hydra"
  ["192.168.30.133"]="Spidey"
  ["192.168.30.134"]="Pun"
)

# Function to ping IP addresses and check their status
check_ips() {
  all_up=true
  for IP in "${!IP_NAMES[@]}"; do
    if ! ping -c 1 $IP &>/dev/null; then
      echo "$(date): ${IP_NAMES[$IP]} ($IP) is down!!!"
      all_up=false
    fi
  done
  if $all_up; then
    echo "all systems normal $(date)"
  fi
}

while true; do
  check_ips
  sleep 61
