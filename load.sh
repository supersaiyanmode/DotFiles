#!/bin/bash

source variables.sh

for program in $PROGRAMS; do
    echo "Saving: " $program
    pushd $program > /dev/null
    $0 $program/load.sh
    popd > /dev/null
done
