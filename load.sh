#!/bin/bash

for program in */ ; do
    echo "Saving: " $program
    pushd $program > /dev/null
    $0 $program/load.sh
    popd > /dev/null
done
