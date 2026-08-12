# Service Management in Linux

## Objective

The objective of this lab was to learn how Linux administrators manage system services using systemd and systemctl. The lab covered checking service status, starting and stopping services, restarting services, enabling and disabling services at boot, viewing service logs, inspecting service configuration, and creating a simple service monitoring script.

## Real-World Scenario

A Linux administrator is responsible for ensuring that important services are running correctly. When a service stops or fails, the administrator needs to determine its current state, check whether it starts automatically at boot, inspect its logs, and restart or reconfigure it when necessary.

## Environment

- Operating System: Ubuntu Linux
- Shell: Bash/Fish
- Version Control: Git and GitHub
- Service Manager: systemd
- Service Management Tool: systemctl
- Logging Tool: journalctl

## Commands and Concepts Practiced

| Command / Concept | Purpose |
|---|---|
| `systemctl status` | Display detailed service status |
| `systemctl is-active` | Check whether a service is currently running |
| `systemctl is-enabled` | Check whether a service starts at boot |
| `systemctl start` | Start a service |
| `systemctl stop` | Stop a service |
| `systemctl restart` | Restart a service |
| `systemctl enable` | Enable automatic startup at boot |
| `systemctl disable` | Disable automatic startup at boot |
| `journalctl -u` | View logs for a specific service |
| `systemctl cat` | Display a service unit configuration |
| `systemctl list-dependencies` | Display service dependencies |
| `chmod +x` | Make a script executable |

## Tasks Completed

### 1. Checked SSH Service Status

Command:

```bash
systemctl status ssh

### 2. Checked Service State

Command:

```bash
systemctl is-enabled ssh
systemctl is-active ssh

### 3. Stopped and Started the SSH Service

Command:

```bash
sudo systemctl stop ssh
sudo systemctl start ssh

### 4. Restarted the SSH Service

Command:

```bash
sudo systemctl restart ssh

### 5. Enabled and Disabled SSH at Boot

Command:

```bash
sudo systemctl disable ssh
sudo systemctl enable ssh

 ssh 

### 6. Viewed SSH Service Logs

Command:

```bash
sudo journalctl -u ssh -n 15

### 7. Inspected Service Configuration

Command:

```bash
systemctl cat ssh

### 8. Viewed Service Dependencies

Command:

```bash
systemctl list-dependencies ssh

### 9. Created a Service Monitoring Script

Command:

```bash
scripts/service-check.sh
chmod +x service-check.sh
./service-check.sh

### 10. Screenshots

SSH Service Status

SSH Enabled and Active

SSH Service Stopped

SSH Service Restarted

SSH Service Disabled

SSH Service Logs

SSH Service Troubleshooting

Service Status Script
