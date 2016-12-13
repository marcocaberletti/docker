#!/bin/sh

set -xe

DOCKER_REGISTRY_HOST=${DOCKER_REGISTRY_HOST:-"cloud-vm181.cloud.cnaf.infn.it"}
KUBE_VERSION=${KUBE_VERSION:-"1.4.6"}

image_name=italiangrid/kube-kubectl-runner:$KUBE_VERSION
dest=${DOCKER_REGISTRY_HOST}/$image_name
	
docker tag $image_name $dest
docker push $dest
