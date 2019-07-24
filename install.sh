#!/bin/bash

source variables.sh

for program in */ ; do
    echo "Installing: " $program
    pushd $program > /dev/null
    $0 $program/install.sh
    popd > /dev/null
done
