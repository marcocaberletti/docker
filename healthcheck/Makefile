TAG=1.0.0
NAME=healthcheck

all: build push clean

build:
	GOOS=linux go build
	docker build --no-cache -t ${NAME}:$(TAG) .

push:
	docker tag ${NAME}:$(TAG) mcaberletti/${NAME}:$(TAG)
	docker push mcaberletti/${NAME}:$(TAG)

	docker tag ${NAME}:$(TAG) mcaberletti/${NAME}:latest
	docker push mcaberletti/${NAME}:latest

clean:
	rm -v healthcheck
