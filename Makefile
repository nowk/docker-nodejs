default: build-docker

build-docker:
	docker build --rm -t nowk/nodejs-env:4.1.0 .

