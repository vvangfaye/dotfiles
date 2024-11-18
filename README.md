# Dotfiles Repository

This repository contains my personal configuration files (dotfiles), including `.zshrc`, `.vimrc`, and `.ssh/config`. The `install.sh` script is designed to install necessary dependencies and configure these files on target system.

## Features

- **Zsh Configuration**: Includes `.zshrc` with Oh My Zsh and several useful plugins.
- **Vim Configuration**: Includes `.vimrc` managed with vim-plug for plugin management.
- **SSH Configuration**: Includes `.ssh/config` to simplify SSH connection settings.
- **Additional Tools**: Installs `fzf`, `eza`.

## Installation Steps

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/vvangfaye/dotfiles
    cd dotfiles
    ```

2. **Run the Installation Script**:

    Ensure the `install.sh` script has execute permissions and run it:

    ```bash
    chmod +x mac_install.sh
    ./mac_install.sh
    ```

    The script will perform the following actions:

    - Update package lists.
    - Install necessary dependencies (`zsh`, `oh-my-zsh`, `fzf`, `vim` ,`eza`.).
    - Clone and install Oh My Zsh and various Zsh plugins.
    - Install `eza` as a modern replacement for `ls`.
    - Install `vim-plug` for managing Vim plugins.
    - Generate the `zh_CN.UTF-8` locale if it doesn't exist.
    - Copy configuration files (`.zshrc`, `.vimrc`, `.ssh/config`) to your home directory, backing up existing files if necessary.
    - Install Vim plugins.
    - Optionally change your default shell to Zsh.
