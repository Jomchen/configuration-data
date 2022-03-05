#!/bin/bash
# start v2ray
# Author: Jomkie


#if [ ! -e /opt/v2ray-logs ];then
#  mkdir /opt/v2ray-logs
#fi

V2RAY_DIR="/opt/v2ray-app-4.44.0"
if [ ! -e "${V2RAY_DIR}/logs" ];then
  mkdir ${V2RAY_DIR}/logs
fi

cd ${V2RAY_DIR}
nohup ${V2RAY_DIR}/v2ray -config ${V2RAY_DIR}/config.json &
unset V2RAY_DIR
