#!/bin/bash

OP_EXTENSION=aeblfdkhhhdcdjpifhhbdiojplfjncoa

EXTENSIONS=(
    aeblfdkhhhdcdjpifhhbdiojplfjncoa
)

EXTENSIONS_PATH=/opt/brave.com/brave/extensions

# Create extensions path if it does not exists
if [ ! -d "$EXTENSIONS_PATH" ]; then
    mkdir -p $EXTENSIONS_PATH
fi

echo '{ "external_update_url": "https://clients2.google.com/service/update2/crx" }' > "${EXTENSIONS_PATH}/${OP_EXTENSION}.json"