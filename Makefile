NAME=node
VERSION=5.12.0


.PHONY: npm-shared-volume

# npm-shared-volume creates a shared volume on the global node_modules
# NOTE the shared volume path may vary with each version
npm-shared-volume:
	docker run -v /usr/local/lib/node_modules --entrypoint node --name npmv$(VERSION) $(NAME):$(VERSION) --version
