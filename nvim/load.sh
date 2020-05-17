#!/bin/bash

NVIM_BASE_DIR=~/.config/nvim

function get_plugin_url {
    local bundle_dir=$1
    pushd $bundle_dir > /dev/null
    cd $bundle_dir
    git config --get remote.origin.url
    popd > /dev/null
}

function get_all_plugin_urls {
    for plugin_dir in $NVIM_BASE_DIR/bundle/*; do
        echo "Loading: " $plugin_dir >&2
        get_plugin_url $plugin_dir
    done
}

function main {
    echo "Saving all plugins.."
    get_all_plugin_urls | sort > plugins.txt

    echo "Saving configuration.."
    cp $NVIM_BASE_DIR/init.vim init.vim
}

main
