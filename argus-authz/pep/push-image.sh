#!/bin/sh

set -xe

DOCKER_REGISTRY_HOST=${DOCKER_REGISTRY_HOST:-"cloud-vm181.cloud.cnaf.infn.it"}
TAG=${TAG:-"1.7.2-1"}

image_name=italiangrid/argus-pep:$TAG
dest=${DOCKER_REGISTRY_HOST}/$image_name
	
docker tag $image_name $dest
docker push $dest
