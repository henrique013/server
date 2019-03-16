#!/usr/bin/env bash

echo "================================================================================================"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Redis <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "================================================================================================"


add-apt-repository -y ppa:chris-lea/redis-server
apt-get update -y
apt-get install -y redis-server

# config
sed -i 's#bind 127.0.0.1#bind 0.0.0.0#' /etc/redis/redis.conf
service redis-server restart