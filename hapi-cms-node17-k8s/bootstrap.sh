#!/bin/bash

# download dependencies defined in package.json file
# and generate a node_modules folder with the installed modules
npm install

# install nodemon globally to system path
npm install -g nodemon

# start server
npm start