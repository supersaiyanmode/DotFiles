#!/bin/bash

OH_MY_ZSH="$HOME/.oh-my-zsh"
ZSHRC="$HOME/.zshrc"

function main {
    rm -rf $OH_MY_ZSH
    rm $ZSHRC

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

    echo "Installing theme.."
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

    echo "Installing configuration.."
    cp zshrc $ZSHRC

    source local-changes.sh
}

main
