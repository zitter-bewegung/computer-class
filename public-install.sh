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



echo "=== Install Script Completed ==="