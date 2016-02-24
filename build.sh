#!/bin/sh

REPO="esycat/upsource"
TAG=${1:-"2.5.3"}

docker build -t $REPO:$TAG $(dirname $0) || exit $?
echo $REPO:$TAG image is ready.
