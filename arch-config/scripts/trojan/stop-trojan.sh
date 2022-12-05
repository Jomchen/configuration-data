#!/bin/bash
# Author: Jomkie
# Description: stop trojan


trojanPort=$(ps -ef | grep -i trojan | grep -v grep | head -n 1 | awk '{print $2}')
if [ -n "$trojanPort" ];then
  echo "stop the pid ${trojanPort} of trojan"
  kill -15 "${trojanPort}"
else
  echo "the application is not started"
fi

unset trojanPort
