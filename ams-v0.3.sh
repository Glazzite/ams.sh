#!/bin/bash
# This script is licened under GNU 3.0 General Public License
# Script Version = v0.3
# Made by Glaz - Glazzite


# -- Flags/Options --

while getopts 'rushv' option; do
	case $option in

		# Variable-Based
		r) recommended=true ;; # Uses Recommended Configs for Server
		u) update=true ;; # Updates the Script
		s) silent=true ;; # Hides all UI and gives simple prompts instead

		h)	# Help/Manual
			printf "\n"
			echo "[AMS] Help/Manual"
			echo "[USAGE] sudo {directory}/ams.sh [Option]"
			printf "\n"
			echo "Flags/Options :"
			printf "\n"
			echo	"-s -> Silent"
			echo 		"Silents all outputs and produces a simpler output instead"
			printf "\n"
			echo	"-r -> Recommended"
			echo		"Auto-selects all recommended settings without any user interaction."
			echo 		"Pairs best with -s (silent)"
			printf "\n"
			echo	"-u -> Update"
			echo 		"Updates the script to the latest version available via Git"
			printf "\n"
			echo 	"-h -> Help"
			echo		"Displays this help guide"
			printf "\n"
			exit 0
			;;

		v)	# Version of the Script
			printf "\n"
			echo "[VER] ams.sh v0.3"
			echo "[STATUS] Alpha"
			printf "\n"
			exit 0
			;;

		*)	# Missed/Invalid Option
			printf "\n"
			echo "[AMS] Invalid Option Used."
			echo "[USAGE] sudo {directory}/ams.sh [Option]"
			echo "[HELP] Use option -h to for help"
			printf "\n"
			exit 0
			;;
	esac
done


# -- Functions --

banner() {

	if [ "$silent" = true ]; then
		echo "[SILENT] Banner Art Skipped"
	else
		printf "\n"
		echo
		echo
		echo "   █████████   ██████   ██████  █████████ ";
		echo "  ███▒▒▒▒▒███ ▒▒██████ ██████  ███▒▒▒▒▒███";
		echo " ▒███    ▒███  ▒███▒█████▒███ ▒███    ▒▒▒ ";
		echo " ▒███████████  ▒███▒▒███ ▒███ ▒▒█████████ ";
		echo " ▒███▒▒▒▒▒███  ▒███ ▒▒▒  ▒███  ▒▒▒▒▒▒▒▒███";
		echo " ▒███    ▒███  ▒███      ▒███  ███    ▒███";
		echo " █████   █████ █████     █████▒▒█████████ ";
		echo "▒▒▒▒▒   ▒▒▒▒▒ ▒▒▒▒▒     ▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒  ";
		echo "                                          ";
		echo "                                          ";
		echo "                                          ";
		printf "\n"
	fi
}

intro() {

	if [ "$silent" = true ]; then
		echo "[SILENT] Intro Skipped"
	else
		printf "\n"
		echo -- Intro --
		echo AMS.sh - Automated Minecraft Server
		echo This script will automate an entire setup of a default, vanilla Minecraft server
		echo "...in just a script."
		echo ----------
		echo
		read -p "Press any key to continue..."
		echo
		echo -- Licensing --
		echo This script is licened under GNU 3.0 General Public License
		echo "For info > https://www.gnu.org/licenses/"
		echo --------------
		echo
		read -p "Press any key to continue..."
		echo
		echo -- Info --
		echo "For Linux (Ubuntu/Debian)"
		echo "Script Version : v0.3"
		echo "Minecraft Server Version : 26.1.1"
		echo "Made by Glaz (@glazzite)"
		echo ----------
		printf "\n"
		read -p "Press any key to start the script"
		echo
	fi
}

script_dir() {
	# -- Enviroment Fix --
	# Taking in Caller's home directory to prevent installing onto /root
	REAL_USER="${SUDO_USER:-$USER}"
	REAL_HOME=$(getent passwd "$REAL_USER" | cut -d: -f6)
	TARGET_DIR="$REAL_HOME/ams"
	mkdir -p "$TARGET_DIR"
	chown "$REAL_USER:$REAL_USER" "$TARGET_DIR"
	cd "$TARGET_DIR"

	if [ "$silent" = true ]; then
		echo "[SILENT] Directory Created at $TARGET_DIR"
	else
		clear
		printf "\n"
		echo -- Script Dir --
		echo Setting up Script Directory...
		echo ----------------
		printf "\n"
		sleep 2
		echo Directory Created : $TARGET_DIR
		sleep 4
	fi
}

install_java() {
	if [ "$silent" = true ]; then
		echo "[SILENT] Installing Java Runtime"
		apt install deafult-jdk openjdk-25-jdk -y > /dev/null 2>&1
		echo "[SILENT] Java Installed"
	else
		clear
		printf "\n"
		echo -- Java --
		echo Installing Required Java Versions...
		echo ----------
		printf "\n"
		sleep 2
		# Requires Sudo
		# default-jdk = Java 21
		# openjdk-25-jdk = Java 25 (experimental version)
		apt install default-jdk openjdk-25-jdk -y
		sleep 4
	fi
}

download_mcserver() {
	if [ "$silent" = true ]; then
		echo "[SILENT] Downloading server.jar"
		curl -sS -o $TARGET_DIR/server.jar https://piston-data.mojang.com/v1/objects/49c8195703ad0ba4f0a4efbccfd85a4a8ca57431/server.jar 
		echo "[SILENT] server.jar Downloaded"
	else
		clear
		printf "\n"
		echo -- Download --
		echo Downloading MC Server 26.1.1 From Minecraft.net
		echo --------------
		printf "\n"
		sleep 2
		# Given link is the direct link to download the .jar file
		curl -o $TARGET_DIR/server.jar https://piston-data.mojang.com/v1/objects/49c8195703ad0ba4f0a4efbccfd85a4a8ca57431/server.jar
		sleep 4
	fi
}

mcserver() {
	if [ "$silent" = true ]; then
		echo "[SILENT] Setting up MC Server"
		java -jar server.jar > /dev/null 2>&1
		sed -i 's/eula=false/eula=true/' eula.txt
	        sed -i 's/motd=A Minecraft Server/motd=Made By ams.sh/' server.properties
		echo "[SILENT] MC Server Ready"
	else
		clear
		printf "\n"
		echo -- Server --
		echo "Setting up Server & and its properties..."
		echo ------------
		printf "\n"
		# Changes Below :
		# eula=true >eula.txt
		# motd=Made By ams.sh >server.properties
		sleep 2
		java -jar server.jar
		sed -i 's/eula=false/eula=true/' eula.txt
		sed -i 's/motd=A Minecraft Server/motd=Made By ams.sh/' server.properties
		sleep 4
	fi
}

finish() {
	if [ "$silent" = true ]; then
		echo "[SILENT] Your MC Server is located in $TARGET_DIR"
		echo "[SILENT] To Start -> java -Xmx4G -Xms4G -jar server.jar -nogui"
		echo "[SILENT] More Settings in server.properties"
	else
		clear
		printf "\n"
		echo -- Script Done --
		echo "Your Minecraft Server is Ready!"
		echo "Your Minecraft Server is located in $TARGET_DIR"
		echo ------------------
		echo
		read -p "Press any key to continue..."
		echo
		echo -- Start Server --
		echo "To start your server, enter the following in a new terminal"
		echo
		echo "> cd $TARGET_DIR"
		echo "> java -Xmx4G -Xms4G -jar server.jar -nogui"
		echo
		echo
		echo -- More --
		echo "More Settings related to the server in server.properties"
		echo ------------------
		printf "\n"
		read -p "Press any key to finish..."
		printf "\n"
	fi
}

stop() {
	if [ "$silent" = true ]; then
		echo "[SILENT] Thank you."
		exit 0
	else
		clear
		exit
	fi
}


# -- Start --

banner
intro
script_dir
install_java
download_mcserver
mcserver
finish
stop

# -- End --
