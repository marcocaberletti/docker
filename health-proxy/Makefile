TAG=1.0.0
NAME=health-proxy

all: build push

build:
	docker build --no-cache -t ${NAME}:$(TAG) .

push:
	docker tag ${NAME}:$(TAG) mcaberletti/${NAME}:$(TAG)
	docker push mcaberletti/${NAME}:$(TAG)

	docker tag ${NAME}:$(TAG) mcaberletti/${NAME}:latest
	docker push mcaberletti/${NAME}:latest
