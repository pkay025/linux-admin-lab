#!/bin/bash

echo "===== Disk Usage Report ====="

echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo

echo "Filesystem Usage:"
df -h
