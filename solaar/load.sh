#!/bin/bash

SOLAAR_BASE_DIR=~/.config/solaar

function main {
    echo "Saving Solaar config.."
    cp $SOLAAR_BASE_DIR/config.yaml .
    cp $SOLAAR_BASE_DIR/rules.yaml .
}

main
