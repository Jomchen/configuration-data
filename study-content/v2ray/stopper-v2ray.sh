#!/bin/bash
# stop v2ray
# Author: Jomkie

v2rayPort=$(ps -ef | grep -i v2ray | grep -v grep | head -n 1 | awk '{print $2}')
if [ -n "$v2rayPort" ];then
  echo "stop the pid ${v2rayPort} of v2ray."
  kill -15 "${v2rayPort}"
else
  echo "the application is not started !!"
fi

unset v2rayPort
