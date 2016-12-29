#!/bin/sh

set -xe

DOCKER_REGISTRY_HOST=${DOCKER_REGISTRY_HOST:-"cloud-vm181.cloud.cnaf.infn.it"}
VERSION=${VERSION:-"5.1.1-1"}

image_name=italiangrid/kibana:$VERSION
dest=${DOCKER_REGISTRY_HOST}/$image_name
	
docker tag $image_name $dest
docker push $dest
