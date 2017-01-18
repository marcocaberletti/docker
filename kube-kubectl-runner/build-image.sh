#!/bin/sh

TAG=${TAG:-"1.4.6"}

docker build --build-arg KUBE_VERSION=${TAG} --no-cache -t italiangrid/kube-kubectl-runner:$TAG .
