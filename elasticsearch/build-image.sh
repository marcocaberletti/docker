#!/bin/sh

TAG=${TAG:-"5.1.1-1"}

docker build --build-arg ES_VERSION=${TAG} --no-cache -t italiangrid/elasticsearch:${TAG} .
