#!/bin/bash

echo "===== Directory Usage Report ====="

for directory in /home /tmp /var
do
    echo
    echo "Checking: $directory"
    sudo du -sh "$directory"
done
