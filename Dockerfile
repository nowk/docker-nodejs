FROM nowk/alpine-nodejs:4.1.0
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

# setup user so files written to /src are not written as root
ONBUILD RUN adduser -D -u 1001 -g '' nodejs \
	&& mkdir -p /src \
	&& chown -R nodejs:nodejs /src

# add node_modules bin to path
ONBUILD ENV PATH=$PATH:/src/node_modules/.bin
ONBUILD USER nodejs

# /src is the working dir
ONBUILD WORKDIR /src

# /src is the mount volume for source files. This will also be where
# node_modules is installed into.
ONBUILD VOLUME /src

