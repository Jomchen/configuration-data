#!/bin/bash
# create a container for mysql:5.7.33
# Author: Jomkie



  #-v /opt/docker-container-data/mysql00/conf:/etc/mysql/conf.d \
docker run \
  -p 3306:3306 \
  --name mysql00 \
  -v /opt/docker-container-data/mysql00/data:/var/lib/mysql \
  -v /opt/docker-container-data/mysql00/logs:/var/log/mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -d mysql:5.7.33 \
