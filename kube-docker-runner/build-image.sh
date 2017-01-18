#!/bin/sh

TAG=${TAG:-"latest"}

docker build --no-cache -t italiangrid/kube-docker-runner:${TAG} .
