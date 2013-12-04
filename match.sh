#!/bin/sh -e
while :
do
    echo "Starting chrome in incognito mode..."
    google-chrome $1 --incognito &
    pid=$!
    echo "Chrome started with pid : $pid ..."
    sleep 600
    echo "Killing the spawned chrome process with pid : $pid ..."
    sudo kill $pid
    echo "Chrome killed ..."
    sleep 2
done
