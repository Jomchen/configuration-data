#!/bin/bash

interfaceName=$1
networkExecutor=$2

if [ -z $interfaceName ];then
    echo "the name of networkInterface must not be null!!"
    return -1
fi

if [ -z $networkExecutor ];then
    echo "command must not be null!!"
    return -1
elif [ "down" == $networkExecutor ];then
    echo "down"
elif [ "up" == $networkExecutor ];then
    echo "up"
else 
    echo "commands ERROR!!"
    return -1;
fi

nmcli connection | grep $1 | awk '{print $2}' | xargs -n 1 -I {} nmcli connection $networkExecutor {}

