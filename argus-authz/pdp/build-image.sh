#!/bin/sh

TAG=${TAG:-"1.7.0-1"}

docker build --build-arg PDP_VERSION=${TAG} --no-cache -t italiangrid/argus-pdp:${TAG} .
