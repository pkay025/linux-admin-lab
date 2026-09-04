# Package Management

## Objective

The objective of this lab was to learn how to manage software packages in Ubuntu Linux using the APT package manager. This included updating package repositories, searching for packages, installing software, verifying installations, and removing packages.

## Real-World Scenario

As a Linux System Administrator, users often request new software installations or the removal of unnecessary applications. Keeping software up to date and managing packages securely is an essential administrative responsibility.

## Environment

- Operating System: Ubuntu Linux
- Package Manager: APT
- Version Control: Git and GitHub

## Commands Practiced

| Command | Description |
|---------|-------------|
| sudo apt update | Update package lists |
| apt list --upgradable | View available package updates |
| apt search | Search for packages |
| apt show | Display package information |
| sudo apt install | Install a package |
| apt list --installed | Verify installed packages |
| sudo apt remove | Remove a package |

## Tasks Completed

### 1. Updated Package Lists

```bash
sudo apt update
```

Downloaded the latest package information from Ubuntu repositories.

### 2. Checked for Available Updates

```bash
apt list --upgradable
```

Displayed packages that could be upgraded.

### 3. Searched for a Package

```bash
apt search htop
```

Located the `htop` package in the Ubuntu repositories.

### 4. Viewed Package Details

```bash
apt show htop
```

Displayed version, maintainer, dependencies, and package description.

### 5. Installed the Package

```bash
sudo apt install htop
```

Installed the `htop` system monitoring utility.

### 6. Verified Installation

```bash
apt list --installed | grep htop
```

Confirmed that `htop` had been installed successfully.

### 7. Removed the Package

```bash
sudo apt remove htop
```

Removed the package from the system.

## Screenshots

### Updating Package Lists

![APT Update](screenshots/01-apt-update.png)

### Upgradable Packages

![Upgradable Packages](screenshots/02-upgradable-packages.png)

### Searching for a Package

![Search Package](screenshots/03-search-package.png)

### Viewing Package Information

![Package Information](screenshots/04-package-information.png)

### Running htop

![Running htop](screenshots/05-htop-running.png)

### Verifying Installation

![Installed Package](screenshots/06-installed-package.png)

### Removing the Package

![Removing Package](screenshots/07-remove-package.png)

