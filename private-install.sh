#!/bin/bash

sudo apt install -y curl

url="https://raw.githubusercontent.com/zitter-bewegung/computer-class/main/public-install.sh"

pwd="pwd1234" #replace with your actual password

curl -s "$url" | bash -s -- "$pwd"