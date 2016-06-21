#!/bin/sh

CONTAINER_NAME=consul
CONTAINER="$(docker ps -a --filter=name=$CONTAINER_NAME --format={{.ID}})"

docker rm -f $CONTAINER_NAME
docker run -d --restart=always -p 8500:8500 --name=consul progrium/consul \
       -server \
       -bootstrap \
       -ui-dir /ui
exit "$?"
