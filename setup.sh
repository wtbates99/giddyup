#!/bin/bash

# Function to print messages with a header
print_message() {
    echo "=================================================================="
    echo "$1"
    echo "=================================================================="
}

# Function to confirm with the user before proceeding
confirm() {
    while true; do
        read -p "$1 [y/n]: " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) echo "Operation cancelled."; exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Function to install packages on Linux or macOS
install_packages() {
    if [ "$1" == "linux" ]; then
        sudo apt-get update && sudo apt-get upgrade -y
        sudo apt-get install -y neovim git curl wget
    elif [ "$1" == "macos" ]; then
        brew update && brew upgrade
        brew install neovim git curl wget
    fi
}

# Determine the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_TYPE="linux"
    CONFIG_FILE="$HOME/.bashrc"
    SHELL_TYPE="bash"
    OH_MY_SHELL_URL="https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh"
    SHELL_CONFIG_NAME="Oh My Bash"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="macos"
    CONFIG_FILE="$HOME/.zshrc"
    SHELL_TYPE="zsh"
    OH_MY_SHELL_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
    SHELL_CONFIG_NAME="Oh My Zsh"
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

print_message "Operating System: $OS_TYPE"
print_message "Shell: $SHELL_TYPE"

# Ensure we're running in the correct shell
if [ "$SHELL" != "/bin/$SHELL_TYPE" ]; then
    echo "Currently in $SHELL shell. Switching to $SHELL_TYPE..."
    exec $SHELL_TYPE "$0"
    exit
fi

# Install necessary packages
confirm "Do you want to install/update the necessary packages (neovim, git, curl, wget) for $OS_TYPE?"
print_message "Installing packages for $OS_TYPE..."
install_packages "$OS_TYPE"

# Check if LazyVim is already installed
if [ ! -d "$HOME/.config/nvim" ] || [ -z "$(ls -A $HOME/.config/nvim)" ]; then
    confirm "LazyVim is not installed. Do you want to install LazyVim?"
    print_message "Installing LazyVim..."
    git clone https://github.com/LazyVim/starter ~/.config/nvim
else
    echo "LazyVim is already installed. Skipping installation."
fi

# Set up aliases in the correct configuration file
confirm "Do you want to set up custom aliases in $CONFIG_FILE?"
print_message "Setting up aliases in $CONFIG_FILE..."

cat <<EOL >> $CONFIG_FILE

# Custom Aliases
alias nv='nvim'
alias ..='cd ..'            # Go up one directory
alias ...='cd ../../'       # Go up two directories
alias ....='cd ../../../'   # Go up three directories
alias ll='ls -lah'          # List all files in long format, human-readable sizes
alias la='ls -A'            # List all entries except for . and ..
alias l='ls -CF'            # List in compact format, directories are marked with a slash
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias desk='cd ~/Desktop'
alias notes='cd ~/notes/'
alias p='python3'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias lg='lazygit'

# Create a new markdown file or open an existing one with today's date
n() {
    filename="\$(date +%Y-%m-%d).md"
    if [ -f "\$filename" ]; then
        nvim "\$filename"
    else
        echo "The file name will be: \$filename"
        echo -n "Do you want to continue? (y/n) "
        read confirm
        if [ "\$confirm" = "y" ]; then
            nvim "\$filename"
        else
            echo "Operation cancelled."
        fi
    fi
}

EOL

# Check if Oh My Zsh/Oh My Bash is installed
if [ ! -d "$HOME/.oh-my-${SHELL_TYPE}" ]; then
    confirm "$SHELL_CONFIG_NAME is not installed. Do you want to install $SHELL_CONFIG_NAME?"
    print_message "Installing $SHELL_CONFIG_NAME..."
    sh -c "$(curl -fsSL $OH_MY_SHELL_URL)"
else
    echo "$SHELL_CONFIG_NAME is already installed. Skipping installation."
fi

# Check if Miniconda is already installed
if command -v conda >/dev/null 2>&1; then
    echo "Miniconda is already installed. Skipping installation."
else
    confirm "Miniconda is not installed. Do you want to install Miniconda?"
    print_message "Installing Miniconda..."
    if [ "$OS_TYPE" == "linux" ]; then
        MINICONDA_INSTALLER=Miniconda3-latest-Linux-x86_64.sh
    elif [ "$OS_TYPE" == "macos" ]; then
        MINICONDA_INSTALLER=Miniconda3-latest-MacOSX-x86_64.sh
    fi
    wget https://repo.anaconda.com/miniconda/$MINICONDA_INSTALLER -O $MINICONDA_INSTALLER
    bash $MINICONDA_INSTALLER -b -p $HOME/miniconda
    rm $MINICONDA_INSTALLER

    # Initialize conda in the shell configuration file
    $HOME/miniconda/bin/conda init $SHELL_TYPE
fi

# Reload the shell configuration file to apply changes
confirm "Do you want to reload the shell configuration file to apply changes?"
print_message "Reloading $CONFIG_FILE..."
source $CONFIG_FILE

echo "Setup complete! Neovim, LazyVim, $SHELL_CONFIG_NAME (if applicable), and Miniconda have been installed, and aliases have been configured in $CONFIG_FILE."
eovim, LazyVim, Oh My Zsh (if applicable), and Miniconda have been installed, and aliases have been configured in $CONFIG_FILE."
