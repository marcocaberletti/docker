NAME=assist-maven
TAG=3-jdk-8

all: build push

build:
	docker build -t ${NAME}:$(TAG) .

push:
	docker tag ${NAME}:$(TAG) mcaberletti/${NAME}:$(TAG)
	docker push mcaberletti/${NAME}:$(TAG)
