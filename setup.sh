#!/bin/bash

# Function to check if a program is installed
is_installed() {
    command -v "$1" >/dev/null 2>&1
}

# Update and install dependencies
echo "Updating packages and installing dependencies..."
sudo apt update && sudo apt install -y make cmake python3-pip

# Install Neovim
if ! is_installed nvim; then
    echo "Installing Neovim..."
    git clone https://github.com/neovim/neovim
    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    cd ..
    rm -rf neovim
else
    echo "Neovim is already installed."
fi

# Clone the Neovim starter configuration
config_dir="$HOME/.config/nvim"
if [ ! -d "$config_dir" ]; then
    echo "Cloning Neovim starter configuration..."
    git clone https://github.com/LazyVim/starter "$config_dir"
    echo "Removing .git folder from configuration..."
    rm -rf "$config_dir/.git"
else
    echo "Neovim configuration already exists at $config_dir."
fi

# Setup .bashrc and .zshrc from repository
echo "Setting up shell configurations..."
for file in .bashrc .zshrc; do
    if [ -f "$HOME/$file" ]; then
        read -p "$file exists. Overwrite? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            cp "$file" "$HOME/"
        fi
    else
        cp "$file" "$HOME/"
    fi
done

# Install Python packages
echo "Installing Python packages..."
pip3 install pandas numpy

# Install and setup pre-commit hooks
echo "Installing pre-commit..."
pip3 install pre-commit
pre-commit install
if [ -f .pre-commit-config.yaml ]; then
    cp .pre-commit-config.yaml "$HOME/"
    pre-commit autoupdate
else
    echo "Pre-commit configuration file not found."
fi

echo "Setup complete!"
echo "You can now start Neovim by typing 'nvim'."
