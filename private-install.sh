#!/bin/bash

url="https://raw.githubusercontent.com/zitter-bewegung/computer-class/main/public-install.sh"

pwd="pwd1234"

curl -s "$url" | bash -s --"$pwd"