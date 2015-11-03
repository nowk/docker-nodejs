default: build-all

NODE_VERSION=v4.1.2

build-docker-base:
	docker build \
		-f Dockerfile.base \
		--rm -t nowk/nodejs-base:${NODE_VERSION} .

build-docker-env:
	docker build \
		-f Dockerfile.env \
		--rm -t nowk/nodejs-env:${NODE_VERSION} .

build-all: build-docker-base build-docker-env
