#!/bin/bash

# Install script for zshrc and vimrc dependencies on macOS

set -e  # Exit immediately if a command exits with a non-zero status

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check for Homebrew and install if not present
if ! command_exists brew; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for the current session
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    # Install oh-my-zsh without changing the default shell
    RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

# 安装 fzf
if [ ! -d "$HOME/.fzf" ]; then
    echo "正在安装 fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
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
if ! brew list eza &>/dev/null; then
    echo "Installing eza..."
    brew install eza
else
    echo "eza is already installed."
fi

# Install vim
if ! brew list vim &>/dev/null; then
    echo "Installing Vim..."
    brew install vim
else
    echo "Vim is already installed via Homebrew."
fi

# Install vim-plug
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "vim-plug is already installed."
fi

# Set locale to zh_CN.UTF-8
if ! locale -a | grep -i "zh_CN.utf8" > /dev/null; then
    echo "Setting locale to zh_CN.UTF-8..."
    # macOS uses UTF-8 locales by default; set LANG environment variable
    echo 'export LANG=zh_CN.UTF-8' >> $HOME/.zshrc
    echo 'export LC_ALL=zh_CN.UTF-8' >> $HOME/.zshrc
else
    echo "Locale zh_CN.UTF-8 is already set."
fi

# Install Vim plugins
echo "Installing Vim plugins..."
vim +PlugInstall +qall

echo "Installation complete."
