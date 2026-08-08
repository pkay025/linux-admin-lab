#!/bin/bash

LOG_FILE="$HOME/projects/linux-admin-lab/11-cron-jobs-automation/logs/disk-monitor.log"

echo "===== Disk Usage Check =====" >> "$LOG_FILE"
echo "Date: $(date)" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"
echo >> "$LOG_FILE"
