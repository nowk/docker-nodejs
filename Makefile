default: build-docker

NODE_VERSION=v0.10.26

build-docker:
	docker build --rm -t nowk/nodejs-env:${NODE_VERSION} .

