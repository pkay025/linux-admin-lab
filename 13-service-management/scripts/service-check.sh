#!/bin/bash

SERVICE="ssh"

echo "===== Service Status Report ====="
echo "Service: $SERVICE"
echo "Date: $(date)"
echo

if systemctl is-active --quiet "$SERVICE"; then
    echo "Status: ACTIVE"
else
    echo "Status: INACTIVE"
fi

if systemctl is-enabled --quiet "$SERVICE"; then
    echo "Boot Status: ENABLED"
else
    echo "Boot Status: DISABLED"
fi
