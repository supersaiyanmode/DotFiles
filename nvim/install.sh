#!/bin/bash

NVIM_BASE_DIR=~/.config/nvim

function install_plugin {
    local git_clone_url=$1

    pushd $NVIM_BASE_DIR/bundle > /dev/null
    git clone $git_clone_url
    popd
}

function install_all_plugins {
    while read plugin_url; do
        echo "Installing:" $plugin_url >&2
        install_plugin $plugin_url
    done
}

function main {
    rm -rf $NVIM_BASE_DIR
    mkdir -p $NVIM_BASE_DIR/bundle
    mkdir -p $NVIM_BASE_DIR/autoload

    echo "Installing all plugins"
    install_all_plugins < plugins.txt

    echo "Installing configuration.."
    cp init.vim $NVIM_BASE_DIR/init.vim

    echo "Installing Pathogen"
    curl -LSso $NVIM_BASE_DIR/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

main
