> I refuse to install node.js on my machine.

# nodejs-base

Node.js Docker base image

## Usage

    FROM nowk/nodejs-base:<VERSION>

---

| Environment Vars |                         |
| ------ | --------------------------------- |
| PATH   | PATH=$PATH:/src/node_modules/.bin |

| Versions |
| -------- |
| v4.1.2   |


# nodejs-env

Node.js Docker environment


## Usage

    FROM nowk/nodejs-env:<VERSION>

---

| Environment Vars |                                   |
| ---------------- | --------------------------------- |
| PATH             | PATH=$PATH:/src/node_modules/.bin |


| User   | UID  | SUDO  |
| ------ | ---- | ----- |
| nodejs | 1000 | FALSE |

*Switching `USER` must be explicitly called.*


| Volumes | Example        |
| ------- | -------------- |
| /src    | -v $(pwd):/src |


| WORKDIR |
| ------- |
| /src    |


## Example

    FROM nowk/nodejs-env:v4.1.2

    USER nodejs

    ---

    docker build --rm -t mynodeproject .
    docker -run -v $(pwd):/src --rm -it mynodeproject mocha --reporter spec

