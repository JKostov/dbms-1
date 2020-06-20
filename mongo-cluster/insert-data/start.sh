#!/bin/sh

CONTAINER_ID="$1"

if [ -z $CONTAINER_ID ]
then
  echo "[INFO]: Container ID not specified, using default 1"
  CONTAINER_ID="1"
fi

docker build --tag cluster-insert-data .

docker kill cluster-insert-data_$CONTAINER_ID
docker rm cluster-insert-data_$CONTAINER_ID

docker run --network mongo-cluster_default --name cluster-insert-data_$CONTAINER_ID cluster-insert-data