#!/bin/sh

CONTAINER_NAME=swarm-node

docker rm -f $CONTAINER_NAME
docker run -d --restart=always \
       --name=$CONTAINER_NAME \
       swarm \
       join \
       --advertise=${NODE_IP}:2375 \
       consul://${CONSUL_IP}:8500

exit "$?"
