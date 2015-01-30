#!/bin/sh

REPO="esycat/upsource"
TAG="1.0"

NAME="upsource"
PORTS="80:80"
VOLUMES=""

docker create --name $NAME -p $PORTS $REPO:$TAG || exit $?

echo $NAME container is ready.
echo To start: docker start $NAME

