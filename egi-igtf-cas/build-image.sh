#!/bin/sh

set -xe

TAG=${TAG:-"latest"}

docker build --no-cache -t italiangrid/egi-igtf-cas:${TAG} .
