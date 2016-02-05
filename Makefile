NAME=nowk/nodejs
VERSION=v4.1.2

default: $(VERSION)

base:
	docker build -f Dockerfile.$@ --rm -t $(NAME)-$@:$(VERSION) .

onbuild: base
	docker build -f Dockerfile.$@ --rm -t $(NAME)-$@:$(VERSION) .

$(VERSION): onbuild
	docker build --rm -t $(NAME):$(VERSION) .


push:
	docker push $(NAME)-base:$(VERSION)
	docker push $(NAME)-onbuild:$(VERSION)
	docker push $(NAME):$(VERSION)

.PHONY: push npm-shared-volume

# npm-shared-volume creates a shared volume on the global node_modules
npm-shared-volume:
	docker run -v /opt/node/lib/node_modules --name npm$(VERSION) $(NAME):$(VERSION)
