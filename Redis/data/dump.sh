#!/usr/bin/env bash

redis-cli -p 6379 -h host.docker.internal -n 0 keys "*" >rediskey.txt
echo "导出 key 完成"

echo "开始读取 value"
IFS_old=$IFS
IFS=$'\n'

for line in $(cat rediskey.txt); do
    value=$(redis-cli -p 6379 -h host.docker.internal -n 0 get $line)
    echo $line"++"$value >>value.txt
done

IFS=$IFS_old
echo "完成"