#!/bin/bash

clear



# Set some colors for output messages
OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
INFO="$(tput setaf 4)[INFO]$(tput sgr0)"
WARN="$(tput setaf 5)[WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
ORANGE=$(tput setaf 166)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4) 
RESET=$(tput sgr0)

# Check if running as root. If root, script will exit
if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting......."
    exit 1
fi


printf "${ORANGE}Hello${Reset}\n"

while true; do
	printf "\n${WARN} ${YELLOW}This will override your current Hyprland configs. Make sure to make a backup, if you want to keep them!\n ${RESET}"
	read -p "${CAT} Confirm? [y/n] " backup_confirmation
	echo ""
	case $backup_confirmation in
		[yY])
			break ;;
		[nN])
			echo "bye..."
			exit 2 ;;
	esac
done

HYPRTEMP="${XDG_CONFIG_HOME:-$HOME/.cache}"/hyprdot
HYPRDOT="${XDG_CONFIG_HOME:-$HOME/.config}"/hypr

git clone https://github.com/keks137/hyprdot.git $HYPRTEMP
rm -rf $HYPRDOT
mv $HYPRTEMP $HYPRDOT
rm -rf $HYPRTEMP

while true; do
	printf "\n${NOTE} Also install my Waybar config? [Recommended] (Will once again delete current configs)\n ${RESET}"
	read -p "${CAT} Confirm? [y/n] " waybar_confirmation
	echo ""
	case $waybar_confirmation in
		[yY])
			WAYBARTEMP="${XDG_CONFIG_HOME:-$HOME/.cache}"/waybartemp
			WAYBARDOT="${XDG_CONFIG_HOME:-$HOME/.config}"/waybar
			git clone https://github.com/keks137/waybardot.git $WAYBARTEMP
			rm -rf $WAYBARDOT
			mv $WAYBARTEMP $WAYBARDOT
			rm -rf $WAYBARTEMP
			break ;;
		[nN])
			break ;;
	esac
done

printf "${ORANGE}Install comleted!${Reset}\n"
