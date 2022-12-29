#!/bin/bash
# having a look at the process
# 将进程的执行文件打印在日志文件中
# Author: Jomkie

processId=$1
if [ -z "$processId" ];then
	echo "未传入 进程ID，格式为：./process-info.sh 进程号"
	return -1;
fi

if [ ! -e "/proc/${processId}/exe" ];then
	echo "请传入正确的进程ID"
	return -1;
fi

ls -ilha /proc/${processId}/exe | tee -a log-$(date +%Y-%m-%d).txt
unset processId
