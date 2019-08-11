#!/bin/sh

# go path
export GOPATH="${HOME}/.go"

# npm path
NPM_PACKAGES=/Users/abranhe/.npm-packages
PATH="$NPM_PACKAGES/bin:$PATH"

# node path
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Gem path
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH