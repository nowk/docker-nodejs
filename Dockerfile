FROM phusion/baseimage:0.9.17
MAINTAINER Yung Hwa Kwon <yung.kwon@damncarousel.com>

ENV NODE_MAJOR v4.1
ENV NODE_VERSION v4.1.2

# install dependencies
RUN apt-get update \
	&& apt-get install -y \
	wget \
	build-essential

# get and unpack node installer
RUN mkdir -p /opt && cd /opt \
	&& wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz \
	&& tar -xf node-$NODE_VERSION-linux-x64.tar.gz \
	&& rm node-$NODE_VERSION-linux-x64.tar.gz

# add to PATH
ENV PATH /opt/node-$NODE_VERSION-linux-x64/bin:$PATH

# clean up
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# setup user so files written to /src are not written as root
ONBUILD RUN addgroup --gid 500 nodejs
ONBUILD RUN adduser --disabled-password --uid 1001 --gid 500 --gecos '' nodejs \
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


LABEL \
	version=$NODE_VERSION \
	os="linux" \
	arch="amd64"
