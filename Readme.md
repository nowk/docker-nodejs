# nodejs-env

Node.js Docker environment

*I refuse to install node.js on my machine.*

## Usage

    FROM nowk/nodejs-env:<VERSION>

---

| Environment Vars |                         |
| ------ | --------------------------------- |
| PATH   | PATH=$PATH:/src/node_modules/.bin |

---

| Versions |
| -------- |
| v4.1.1   |

*Commands are run as user `nodejs`.*

## Example

    FROM nowk/nodejs-env:v4.1.1

    ---

    docker build --rm -t mynodeproject .
    docker -run -v $(pwd):/src --rm -it mynodeproject mocha --reporter spec

