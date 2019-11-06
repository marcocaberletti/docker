TAG=9.0.14-oraclejdk
NAME=assist-tomcat

all: build push

build:
	docker build --no-cache -t ${NAME}:$(TAG) .

push:
	docker tag ${NAME}:$(TAG) mcaberletti/${NAME}:$(TAG)
	docker push mcaberletti/${NAME}:$(TAG)
