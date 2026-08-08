#!/bin/bash

echo "===== System Health Check ====="
echo

echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo "Date: $(date)"
echo

echo "===== Uptime ====="
uptime

echo
echo "===== Memory Usage ====="
free -h

echo
echo "===== Disk Usage ====="
df -h /

echo
echo "===== System Load ====="
uptime
