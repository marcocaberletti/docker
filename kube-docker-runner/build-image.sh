#!/bin/sh

TAG=${TAG:-"latest"}
JNLP_VERSION=${JNLP_VERSION:-"2.62"}

docker build --build-arg VERSION=${JNLP_VERSION} --no-cache -t italiangrid/kube-docker-runner:${TAG} .
