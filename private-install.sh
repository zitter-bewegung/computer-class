#!/bin/bash

url="https://raw.githubusercontent.com/user/repo/main/script.sh"

pwd="pwd1234"

curl -s "$url" | bash -s --"$pwd"