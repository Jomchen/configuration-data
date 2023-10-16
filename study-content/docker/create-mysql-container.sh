#!/bin/bash
# create a container for mysql:5.7.33
# Author: Jomkie


containerName=mysql00
baseDir=/opt/docker-container/mysql/${containerName}
logDir=${baseDir}/logs
dataDir=${baseDir}/datas

if [ ! -e ${baseDir} ];then
  mkdir -p ${baseDir}
fi
if [ ! -e ${logDir} ];then
  mkdir -p ${logDir}
fi
if [ ! -e ${dataDir} ];then
  mkdir -p ${dataDir}
fi

  #-v /opt/docker-container-data/mysql00/conf:/etc/mysql/conf.d \
docker run \
  -p 3306:3306 \
  --name ${containerName} \
  -v ${logDir}:/var/log/mysql \
  -v ${dataDir}:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -d mysql:5.7.33 \

unset containerName
unset baseDir
unset logDir
unset dataDir
