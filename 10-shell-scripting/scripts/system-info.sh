#!/bin/bash

echo "===== System Information ====="

echo "Hostname:"
hostname

echo "Current User:"
whoami

echo "Operating System:"
cat /etc/os-release | grep PRETTY_NAME

echo "Kernel:"
uname -r

echo "IP Address:"
hostname -I
