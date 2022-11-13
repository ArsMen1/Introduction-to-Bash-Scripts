#!/bin/bash

export HOSTNAME="$(hostname)"
    echo "HOSTNAME = $HOSTNAME"
export TIMEZONE="$(timedatectl | grep "Time zone"| xargs)"
    echo "TIMEZONE = $TIMEZONE"
export USER="$(whoami)"
    echo "USER = $USER"
export OS="$(cat /etc/issue | xargs|  tr -s "n l" ' ')"
    echo "OS = $OS"
export DATE="$(date)"
    echo "DATE = $DATE"
export UPTIME="$(uptime -p)"
    echo "UPTIME = $UPTIME"
export UPTIME_SEC="$(awk '{print $1}' /proc/uptime)"
    echo "UPTIME_SEC = $UPTIME_SEC"
export IP="$(ip a | grep "inet"| sed -n 1p| xargs)"
    echo "IP = $IP"
export MASK="$(ifconfig | grep netmask|sed -n 2p| xargs)"
    echo "MASK = $MASK"
export GATEWAY="$(ip -4 route show default)"
    echo "GATEWAY = $GATEWAY"
export RAM_TOTAL="$(grep MemTotal /proc/meminfo | xargs)"
    echo "RAM_TOTAL = $RAM_TOTAL"
export RAM_USED="$(vmstat -s| grep "used m" | xargs)"
    echo "RAM_USED = $RAM_USED"
export RAM_FREE="$(grep MemFree /proc/meminfo | xargs)"
    echo "RAM_FREE = $RAM_FREE"
# export SPACE_ROOT="$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2}')"
export SPACE_ROOT="$(df -hmT | awk '/\/$/ {printf "%.2f MB", $3}' )"
    echo "SPACE_ROOT = $SPACE_ROOT"
export SPACE_ROOT_USED="$(df -hmT | awk '/\/$/ {printf "%.2f MB", $4/1024}')"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
export SPACE_ROOT_FREE="$(df -hmT | awk '/\/$/ {printf "%.2f MB", $5/1024}')"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"

chmod +x ./check.sh
bash check.sh


test