default: build-docker

NODE_VERSION=v0.11.13

build-docker:
	docker build --rm -t nowk/nodejs-env:${NODE_VERSION} .

