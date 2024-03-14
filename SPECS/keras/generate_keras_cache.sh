#!/bin/bash

# output = tensorflow-$TF_VERSION-cache.tar.gz
# TensorFlow version to use
TF_VERSION="3.0.0"

docker build --build-arg TF_VERSION=$TF_VERSION -t tensorflow_image .

CONTAINER_ID=$(docker run -d tensorflow_image)

docker cp $CONTAINER_ID:/root/tensorflow-$TF_VERSION-cache.tar.gz $PWD

docker stop $CONTAINER_ID
docker rm $CONTAINER_ID