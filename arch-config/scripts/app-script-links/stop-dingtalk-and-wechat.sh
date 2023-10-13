#!/bin/bash
# stop dingtalk and wechat
# Author: Jomkie

unset dingtalkPid
unset wechatPid
dingtalkPid=$(ps -ef | grep -iE 'dingtalk' | grep -i '/com\.alibabainc\.dingtalk$' | grep -v 'grep' | awk '{print $2}')
if [ -n $dingtalkPid ];then
	kill -9 $dingtalkPid
fi
#wechatPid=$(ps -ef | grep -iE 'wechat' | grep -i '/usr/lib/electron/electron --enable-crashpad /usr/lib/wechat-uos' | grep -v 'grep ' | awk '{print $2}')
#if [ -n $wechatPid ];then
#	kill -9 $wechatPid
#fi

unset dingtalkPid
unset wechatPid
