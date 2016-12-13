#!/bin/sh

KUBE_VERSION=${KUBE_VERSION:-"1.4.6"}

docker build --no-cache -t italiangrid/kube-kubectl-runner:$KUBE_VERSION .
