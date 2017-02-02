#!/bin/sh

TAG=${TAG:-"1.7.0-1"}

docker build --build-arg PAP_VERSION=${TAG} --no-cache -t italiangrid/argus-pap:${TAG} .
