# Linux SSH & Remote Administration Lab

## Overview

This lab covers SSH and secure remote administration on Linux.

## Task 1 — SSH Installation & Verification

### Objective

Install, verify, and test the OpenSSH server.

### Commands

    ssh --version
    dpkg -l | grep openssh-server
    sudo apt update
    sudo apt install openssh-server
    sudo systemctl status ssh
    sudo systemctl start ssh
    sudo systemctl enable ssh
    sudo ss -tulpn | grep :22

Test a local SSH connection:

    ssh (whoami)@localhost

Exit the SSH session:

    exit

---

## Task 2 — SSH Remote Administration

### Objective

Learn how to connect to a Linux system remotely using SSH.

Find the IP address:

    ip addr
    hostname -I

Check the current username:

    whoami

Basic SSH syntax:

    ssh username@ip_address

Test SSH locally:

    ssh (whoami)@localhost

Verify the SSH session:

    whoami
    hostname
    echo $SSH_CONNECTION

Exit:

    exit

---

## Task 3 — SSH Configuration

### Objective

Understand SSH server configuration and learn how to validate configuration changes.

SSH server configuration:

    /etc/ssh/sshd_config

SSH client configuration:

    /etc/ssh/ssh_config

List SSH configuration files:

    ls -la /etc/ssh/
    ls -la /etc/ssh/sshd_config.d/

View the effective SSH configuration:

    sudo sshd -T

Check important settings:

    sudo sshd -T | grep -E 'port|permitrootlogin|passwordauthentication|pubkeyauthentication'

Validate the configuration:

    sudo sshd -t

No output from `sshd -t` indicates that the configuration syntax is valid.

---

## Task 4 — SSH Key Generation

### Objective

Generate an SSH key pair for secure authentication.

Generate an Ed25519 key:

    ssh-keygen -t ed25519 -f ~/.ssh/sysadmin_lab_key

This creates:

    ~/.ssh/sysadmin_lab_key
    ~/.ssh/sysadmin_lab_key.pub

Check the generated files:

    ls -l ~/.ssh/sysadmin_lab_key*

Display the public key:

    cat ~/.ssh/sysadmin_lab_key.pub

The private key must never be shared.

Set private key permissions:

    chmod 600 ~/.ssh/sysadmin_lab_key

Set public key permissions:

    chmod 644 ~/.ssh/sysadmin_lab_key.pub

---

## Task 5 — Key-Based Authentication

### Objective

Configure SSH public-key authentication and connect using an SSH private key.

Copy the public key to the server:

    ssh-copy-id -i ~/.ssh/sysadmin_lab_key.pub localhost

The public key is stored in:

    ~/.ssh/authorized_keys

View the authorized keys:

    cat ~/.ssh/authorized_keys

Connect using the private key:

    ssh -i ~/.ssh/sysadmin_lab_key localhost

Verify the connection:

    whoami
    hostname
    echo $SSH_CONNECTION

Exit:

    exit

Use verbose mode to troubleshoot authentication:

    ssh -v -i ~/.ssh/sysadmin_lab_key localhost

Secure SSH permissions:

    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/sysadmin_lab_key
    chmod 644 ~/.ssh/sysadmin_lab_key.pub

---

## Task 6 — SCP File Transfer

### Objective

Use SCP to securely transfer files over SSH.

Create a test directory:

    mkdir -p ~/scp-lab

Create a test file:

    echo "This file was transferred using SCP." > ~/scp-lab/test-file.txt

Verify the file:

    cat ~/scp-lab/test-file.txt

Upload the file using SCP:

    scp -i ~/.ssh/sysadmin_lab_key ~/scp-lab/test-file.txt (whoami)@localhost:/tmp/

Verify the remote file:

    ls -l /tmp/test-file.txt
    cat /tmp/test-file.txt

Remove the local copy:

    rm ~/scp-lab/test-file.txt

Copy the remote file back:

    scp -i ~/.ssh/sysadmin_lab_key (whoami)@localhost:/tmp/test-file.txt ~/scp-lab/

Verify:

    cat ~/scp-lab/test-file.txt

Cleanup:

    rm /tmp/test-file.txt
    rm -rf ~/scp-lab

---

## Task 7 — SFTP File Transfer

### Objective

Use SFTP for interactive file management over SSH.

Create a test directory:

    mkdir -p ~/sftp-lab

Create a test file:

    echo "This file was transferred using SFTP." > ~/sftp-lab/sftp-test.txt

Verify:

    cat ~/sftp-lab/sftp-test.txt

Start SFTP using the SSH key:

    sftp -i ~/.ssh/sysadmin_lab_key (whoami)@localhost

This opens an interactive SFTP session:

    sftp>

Display the remote working directory:

    pwd

List remote files:

    ls

Display the local working directory:

    lpwd

List local files:

    lls

Upload a file:

    put ~/sftp-lab/sftp-test.txt /tmp/

Verify:

    ls /tmp/sftp-test.txt

Download the file:

    get /tmp/sftp-test.txt ~/sftp-lab/downloaded-sftp-test.txt

Exit SFTP:

    exit

Verify the downloaded file:

    cat ~/sftp-lab/downloaded-sftp-test.txt

Cleanup:

    rm /tmp/sftp-test.txt
    rm -rf ~/sftp-lab

---

## Task 8 — SSH Security Hardening

### Objective

Apply basic SSH security hardening while maintaining SSH access.

Back up the SSH configuration:

    sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

Verify the backup:

    ls -l /etc/ssh/sshd_config*

Edit the SSH configuration:

    sudo nano /etc/ssh/sshd_config

Disable direct root login:

    PermitRootLogin no

Limit authentication attempts:

    MaxAuthTries 3

Enable public-key authentication:

    PubkeyAuthentication yes

Password authentication remained enabled during the lab:

    PasswordAuthentication yes

Validate the configuration:

    sudo sshd -t

Check the effective settings:

    sudo sshd -T | grep -E 'permitrootlogin|passwordauthentication|pubkeyauthentication|maxauthtries'

The resulting settings were:

    maxauthtries 3
    permitrootlogin no
    pubkeyauthentication yes
    passwordauthentication yes

Restart SSH:

    sudo systemctl restart ssh

Check the service:

    sudo systemctl status ssh

Test key-based SSH after hardening:

    ssh -i ~/.ssh/sysadmin_lab_key (whoami)@localhost

Verify:

    whoami

Exit:

    exit

---

## Important Files

    /etc/ssh/sshd_config
    /etc/ssh/ssh_config
    ~/.ssh/
    ~/.ssh/authorized_keys
    ~/.ssh/sysadmin_lab_key
    ~/.ssh/sysadmin_lab_key.pub

---

