#!/bin/bash
set -e

echo "Sit back and relax ..."

while read LINE; do
    [ -z "$LINE" ] && continue
    if [ "x${LINE:0:1}" != "x#" ]
    then
        echo "###########################"
        echo "Installing $LINE ..."
        sudo apt-get install -qq -y $LINE
        echo "Done $LINE ..."        
    fi
done

echo "Everthing is done ..."

