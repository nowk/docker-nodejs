> I refuse to install node.js on my machine.

# node

Node.js Docker executable


## Install

Create the shared volume to share global `node_modules` state across different 
executables.

    make node-shared-volume

Add the contents of `bin` to your `$PATH`.


## License

MIT
