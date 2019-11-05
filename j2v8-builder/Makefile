REGISTRY=316309846858.dkr.ecr.us-west-2.amazonaws.com
NAME=j2v8-builder
TAG=latest

all: build push

build:
	docker build -t ${NAME}:$(TAG) .

push:
	docker tag ${NAME}:$(TAG) $(REGISTRY)/${NAME}:$(TAG)
	docker push $(REGISTRY)/${NAME}:$(TAG)
