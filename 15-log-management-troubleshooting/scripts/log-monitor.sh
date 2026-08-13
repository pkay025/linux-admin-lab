#!/bin/bash

echo "===== Linux Log Monitoring Report ====="
echo "Date: $(date)"
echo

echo "----- SSH Service Status -----"
systemctl is-active ssh

echo
echo "----- Recent SSH Errors -----"
journalctl -u ssh -p err -n 10 --no-pager

echo
echo "----- Recent Authentication Events -----"
sudo journalctl -u ssh -n 10 --no-pager
