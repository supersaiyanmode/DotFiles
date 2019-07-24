#!/bin/bash

TMUX_CONF=~/.tmux.conf
TMUX_BASE_DIR=~/.tmux/

function main {
    rm -rf $TMUX_CONF $TMUX_BASE_DIR
    mkdir -p $TMUX_BASE_DIR/plugins

    echo "Installing TPM .."
    git clone https://github.com/tmux-plugins/tpm $TMUX_BASE_DIR/plugins/tpm

    echo "Installing configuration.."
    cp tmux.conf $TMUX_CONF

    echo "Installing plugins .."
    $TMUX_BASE_DIR/plugins/tpm/bin/install_plugins
}

main
