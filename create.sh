#!/bin/sh

REPO="esycat/upsource"
TAG="2.5.1"

NAME="upsource"
PORTS="80:8080"
VOLUMES=""

docker create --name $NAME -p $PORTS $REPO:$TAG --restart=always || exit $?

echo $NAME container is ready.
echo To start: docker start $NAME
