#!/bin/sh

set -xe

DOCKER_REGISTRY_HOST=${DOCKER_REGISTRY_HOST:-"cloud-vm114.cloud.cnaf.infn.it"}
TAG=${TAG:-"5.1.1-1"}

image_name=italiangrid/elasticsearch:$TAG
dest=${DOCKER_REGISTRY_HOST}/$image_name
	
docker tag $image_name $dest
docker push $dest
