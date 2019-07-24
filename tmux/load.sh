#!/bin/bash

TMUX_CONF=~/.tmux.conf

function main {
    echo "Saving configuration .."
    cp $TMUX_CONF tmux.conf
}

main
