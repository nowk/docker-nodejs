NAME=node
VERSION=5.12.0


.PHONY: npm-shared-volume execjs-shared-volume

# npm-shared-volume creates a shared volume on the global node_modules
# NOTE the shared volume path may vary with each version
npm-shared-volume:
	docker run -v /usr/local/lib/node_modules --entrypoint node --name npmv$(VERSION) $(NAME):$(VERSION) --version

# execjs-shared-volume creates a shared volume for use as the execjs for Rails
# applications.
# Because we cannot plainly overlay the FS the volume, we need to add the
# shared-volume to PATH
#
#	# get the full PATH env from the docker in question, this uses a docker.sh'd
#	# ruby
#	path=$(echo "$(ruby -- --entrypoint env | grep ^PATH=)" | sed "s#PATH=##")
#	path="/opt/execjs/bin:$path"
#
# The contents of /opt/execjs/bin are `nodej`, `nodejs` and `npm`
execjs-shared-volume:
	docker run -v /opt/execjs/bin --entrypoint /bin/bash --name execjs $(NAME):$(VERSION) -c "mkdir -p /opt/execjs && cp -R /usr/local/bin /opt/execjs"
