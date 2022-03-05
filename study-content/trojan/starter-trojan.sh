#!/bin/bash
# Author: Jomkie
# start trojan

TROJAN_HOME="/opt/trojan1.16.0"
cd $TROJAN_HOME

if [ ! -e "$TROJAN_HOME/logs" ];then
 mkdir $TROJAN_HOME/logs
fi

nohup $TROJAN_HOME/trojan -l $TROJAN_HOME/logs/$(date +%Y-%m-%d).log --config $TROJAN_HOME/config.json &
