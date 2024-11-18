#!/bin/bash

# Install script for zshrc, vimrc, .ssh/config and their dependencies

set -e  # Exit immediately if a command exits with a non-zero status

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to copy dotfiles with backup
copy_dotfile() {
    src="$1"
    dest="$HOME/$2"
    if [ -e "$dest" ]; then
        echo "Backing up existing $dest to ${dest}.bak_$(date +%s)"
        mv "$dest" "${dest}.bak_$(date +%s)"
    fi
    cp "$src" "$dest"
    echo "Copied $src to $dest"
}

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install zsh if not installed
if ! command_exists zsh; then
    echo "Installing zsh..."
    sudo apt install -y zsh
else
    echo "zsh is already installed."
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    # Install oh-my-zsh without changing the default shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "oh-my-zsh is already installed."
fi

# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
else
    echo "fzf is already installed."
fi

# Install zsh plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed."
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi

# fzf-tab
if [ ! -d "${ZSH_CUSTOM}/plugins/fzf-tab" ]; then
    echo "Installing fzf-tab..."
    git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM}/plugins/fzf-tab
else
    echo "fzf-tab is already installed."
fi

# Install eza (modern replacement for 'ls')
if ! command_exists eza; then
    echo "Installing eza..."
    # Install Rust if not installed
    if ! command_exists cargo; then
        echo "Installing Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi
    cargo install eza
else
    echo "eza is already installed."
fi

# Install Vim
if ! command_exists vim; then
    echo "Installing Vim..."
    sudo apt install -y vim
else
    echo "Vim is already installed."
fi

# Install vim-plug
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "vim-plug is already installed."
fi

# Generate Chinese locale
if ! locale -a | grep -i "zh_CN.utf8" > /dev/null; then
    echo "Generating zh_CN.UTF-8 locale..."
    sudo locale-gen zh_CN.UTF-8
    sudo update-locale
else
    echo "Locale zh_CN.UTF-8 already exists."
fi

# Copy configuration files
echo "Copying configuration files..."

# Copy .zshrc
if [ -f "${SCRIPT_DIR}/zshrc" ]; then
    copy_dotfile "zshrc" ".zshrc"
else
    echo "Warning: zshrc file not found."
fi

# Copy .vimrc
if [ -f "${SCRIPT_DIR}/vimrc" ]; then
    copy_dotfile "vimrc" ".vimrc"
else
    echo "Warning: vimrc file not found."
fi

# Copy .ssh/config
if [ -f "${SCRIPT_DIR}/.ssh/config" ]; then
    mkdir -p "$HOME/.ssh"
    copy_dotfile ".ssh/config" ".ssh/config"
    chmod 600 "$HOME/.ssh/config"
else
    echo "Warning: .ssh/config file not found."
fi

# Install Vim plugins
echo "Installing Vim plugins..."
vim +PlugInstall +qall

echo "Installation complete."

# Optional: Change default shell to zsh
read -p "Do you want to change the default shell to zsh? [y/N]: " change_shell
if [[ "$change_shell" =~ ^[Yy]$ ]]; then
    chsh -s "$(which zsh)"
    echo "Default shell changed to zsh. Please log out and log back in for the changes to take effect."
else
    echo "Default shell remains unchanged."
fi
