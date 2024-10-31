#!/bin/bash

clear

# Check if running as root. If root, script will exit
if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting......."
    exit 1
fi


echo "Hello"

while true; do
	printf "${INFO} Current keyboard layout is ${ORANGE}$layout${RESET}\n"
	read -p "${CAT} Is this correct? [y/n] " keyboard_layout

git clone https://github.com/keks137/hyprdot.git "${XDG_CONFIG_HOME:-$HOME/.cache}"/hyprdot
cd "${XDG_CONFIG_HOME:-$HOME/.cache}"/hyprdot
