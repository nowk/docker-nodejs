# nodejs-env:4.1.0

Node.js Enviroment Base Docker

*I refuse to install node.js on my machine.*

## Setup

To build the Docker image locally.

    make

Docker image gives you these on build.

    ENV PATH=$PATH:/src/node_modules/.bin
    USER nodejs
    WORKDIR /src
    VOLUME /src

`/src` has been `chown`'d to user `nodejs`

## Usage

    FROM nowk/nodejs-env:4.1.0

## License

MIT
