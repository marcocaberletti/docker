#!/bin/sh

set -xe

DOCKER_REGISTRY_HOST=${DOCKER_REGISTRY_HOST:-"cloud-vm181.cloud.cnaf.infn.it"}
BRANCH=${BRANCH:-"latest"}

image_name=italiangrid/puppet-forge-server:$BRANCH
dest=${DOCKER_REGISTRY_HOST}/$image_name
	
docker tag $image_name $dest
docker push $dest
