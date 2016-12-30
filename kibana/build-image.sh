#!/bin/sh

TAG=${TAG:-"5.1.1-1"}

docker build --no-cache -t italiangrid/kibana:${TAG} .
