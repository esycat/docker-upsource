#!/bin/sh

REPO="esycat/upsource"
TAG=${1:-"1.0.1"}

docker build -t $REPO:$TAG $(dirname $0) || exit $?
echo $REPO:$TAG image is ready.

