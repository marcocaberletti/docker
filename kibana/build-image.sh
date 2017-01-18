#!/bin/sh

TAG=${TAG:-"5.1.1-1"}

docker build --build-arg KIBANA_VERSION=${TAG} --no-cache -t italiangrid/kibana:${TAG} .
