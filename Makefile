default: build-docker

NODE_VERSION=v4.1.2

build-docker:
	docker build --rm -t nowk/nodejs-env:${NODE_VERSION} .

