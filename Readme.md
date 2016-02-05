> I refuse to install node.js on my machine.

# nowk/nodejs

Node.js Docker

---

| Entrypoint | Cmd     |
| ---------- | ------- |
| node       | --help  |

## Example

    docker -run -v $(pwd):/src --rm -it nowk/nodejs:v4.1.2 --help


---

## -base

    FROM nowk/nodejs-base:<VERSION>

---

| Environment Vars |                         |
| ---------------- | --------------------------------- |
| PATH             | PATH=$PATH:/src/node_modules/.bin |

| Versions |
| -------- |
| v4.1.2   |


---

## -onbuild

    FROM nowk/nodejs-onbuild:<VERSION>

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

