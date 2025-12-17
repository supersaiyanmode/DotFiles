#!/bin/bash

SOLAAR_BASE_DIR=~/.config/solaar

function main {
    mkdir -p $SOLAAR_BASE_DIR

    echo "Installing Solaar config"
    cp ./rules.yaml $SOLAAR_BASE_DIR/.
    cp ./config.yaml $SOLAAR_BASE_DIR/.
}

main
