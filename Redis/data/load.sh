#!/usr/bin/env bash

echo "开始读取"
IFS_old=$IFS
IFS=$'\n'

for line in $(cat value.txt); do
    OLD_IFS="$IFS"
    IFS="++"
    arr=($line)
    IFS="$OLD_IFS"

    key=${arr[0]}
    value=${arr[2]}

    echo "key: $key"
    echo "value: $value"

    redis-cli -h localhost -p 6379 -a password set $key $value
done

IFS=$IFS_old
echo "完成"
