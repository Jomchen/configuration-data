#!/bin/bash
# monitor the cpu's information
# 查看 cpu 耗能进程的倒序排序
# Author: Jomkie


COUNT=10
if [ ! -z "$1" ];then
	COUNT=$1
fi

ps aux --sort=-pcpu | tail -n +2 | head -n ${COUNT}
unset COUNT
