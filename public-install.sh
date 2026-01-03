#!/bin/bash

echo "=== Starting Install Script ==="
# Add user here and permissions here

#name=${1:-"World"}
#echo "Hello, $name!"

echo "Updating package list..."
sudo apt-get update
echo "Updating package completed."


echo "Upgrading packages..."
sudo apt-get upgrade -y
echo "Upgrading packages completed."


#Chromium
if snap list chromium >/dev/null 2>&1; then
    echo "Chromium is already installed. Updating to the latest version..."
    sudo snap refresh chromium
    echo "Chromium update completed."
else
    echo "Chromium is not installed. Installing Chromium..."
    sudo snap install chromium
    echo "Chromium installation completed."
fi


#Neovim
if snap list nvim >/dev/null 2>&1; then
    echo "Neovim is already installed. Updating to the latest version..."
    sudo snap refresh nvim
    echo "Neovim update completed."
else
    echo "Neovim is not installed. Installing Neovim..."
    sudo snap install nvim --classic
    echo "Neovim installation completed."
fi


#Okular
if snap list okular >/dev/null 2>&1; then
    echo "Okular is already installed. Updating to the latest version..."
    sudo snap refresh okular
    echo "Okular update completed."
else
    echo "Okular is not installed. Installing Okular..."
    sudo snap install okular
    echo "Okular installation completed."
fi


#VS Code
if snap list code >/dev/null 2>&1; then
    echo "VS Code is already installed. Updating to the latest version..."
    sudo snap refresh code
    echo "VS Code update completed."
else
    echo "VS Code is not installed. Installing VS Code..."
    sudo snap install code --classic
    echo "VS Code installation completed."
fi


#Python tools
echo "Checking pip3 installation..."
if ! command -v pip3 >/dev/null 2>&1; then
    echo "pip3 not found. Installing..."
    sudo apt update
    sudo apt install -y python3-pip
    echo "pip3 installation completed."
else
    echo "pip3 is already installed: $(pip3 --version)"
fi

echo "Upgrading pip3 to latest version..."
python3 -m pip install --upgrade pip
echo "pip upgrade completed."

CONDA_DIR="$HOME/miniconda3"
echo "Checking if Miniconda is installed..."
if [ -d "$CONDA_DIR" ]; then
    echo "Miniconda already installed at $CONDA_DIR"
    echo "Updating conda..."
    "$CONDA_DIR/bin/conda" update -y conda
    echo "Conda update completed."
else
    echo "Miniconda is not installed. Installing Miniconda..."
    INSTALLER="/tmp/Miniconda3-latest-Linux-x86_64.sh"
    curl -sL "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -o "$INSTALLER"
    bash "$INSTALLER" -b -p "$CONDA_DIR"
    "$CONDA_DIR/bin/conda" init bash
    echo "Miniconda installation completed. Please restart your terminal or run 'source ~/.bashrc'"
fi


#.NET
if dpkg -s aspnetcore-runtime-8.0 >/dev/null 2>&1; then
    echo "ASP.NET Core Runtime 8.0 is already installed."
else
    echo "ASP.NET Core Runtime 8.0 is not installed. Installing..."

    # Register Microsoft package repository (if not already done)
    if [ ! -f /etc/apt/sources.list.d/microsoft-prod.list ]; then
        wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
        sudo dpkg -i /tmp/packages-microsoft-prod.deb
        sudo rm /tmp/packages-microsoft-prod.deb
    fi

    # Install dependencies and runtime
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates
    sudo apt-get install -y aspnetcore-runtime-8.0

    echo "ASP.NET Core Runtime 8.0 installation completed."
fi

echo "=== Install Script Completed ==="