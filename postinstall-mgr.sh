#!/bin/sh

CONTAINER_NAME=swarm-manager

docker rm -f $CONTAINER_NAME
docker run -d --restart=always \
       --name="$CONTAINER_NAME" \
       -p 4000:4000 swarm \
       manage \
       -H :4000 \
       --replication \
       --advertise ${MANAGER_IP}:4000 \
       consul://${CONSUL_IP:-10.1.0.12}:8500

exit "$?"
