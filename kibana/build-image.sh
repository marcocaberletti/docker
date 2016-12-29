#!/bin/sh

VERSION=${VERSION:-"5.1.1-1"}

docker build --no-cache -t italiangrid/kibana:${VERSION} .
