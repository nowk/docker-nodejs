default: build-docker

build-docker:
	docker build --rm -t nowk/nodejs-env:v4.1.1 .

