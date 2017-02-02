#!/bin/sh

TAG=${TAG:-"1.7.2-1"}

docker build --build-arg PEP_VERSION=${TAG} --no-cache -t italiangrid/argus-pep:${TAG} .
