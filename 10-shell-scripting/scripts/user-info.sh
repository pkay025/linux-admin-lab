#!/bin/bash

echo "===== User Information ====="

read -p "Enter a username: " username

echo
echo "Checking user: $username"

if id "$username" &>/dev/null; then
    echo "User exists."
    echo "User ID and Groups:"
    id "$username"
else
    echo "User does not exist."
fi
