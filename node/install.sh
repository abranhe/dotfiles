#!/bin/sh
#
# Install global NPM packages

if command -v npm >/dev/null; then

  mkdir "${HOME}/.npm-packages"

  npm config \
    set prefix "${HOME}/.npm-packages"

  # NPM_PACKAGES="${HOME}/.npm-packages"

  # export PATH="$NPM_PACKAGES/bin:$PATH"

  npm install --global \
    react-native-cli \
    http-server \
    @abranhe/nm \
    yarn \
    now \
    np \
    yo \
    n
fi
