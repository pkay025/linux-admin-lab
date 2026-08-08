#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

echo "===== Directory Usage ====="
echo "Directory: $1"
sudo du -sh "$1"
