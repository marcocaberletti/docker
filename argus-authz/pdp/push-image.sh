#!/bin/sh

set -xe

DOCKER_REGISTRY_HOST=${DOCKER_REGISTRY_HOST:-"cloud-vm181.cloud.cnaf.infn.it"}
TAG=${TAG:-"1.7.0-1"}

image_name=italiangrid/argus-pdp:$TAG
dest=${DOCKER_REGISTRY_HOST}/$image_name
	
docker tag $image_name $dest
docker push $dest
