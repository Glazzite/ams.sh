#!/bin/bash

# An Automatic Minecraft Server Setuper for Linux (Ubuntu/Debian)
# Minecraft Server Version = 26.1.1

# Script Version = v1.0
# Made by Glaz - Glazzite

# -- Start --

clear

# -- Intro --
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
echo
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
echo "Script Version : v1.0"
echo "Minecraft Server Version : 26.1.1"
echo "Made by Glaz (@glazzite)"
echo ----------
echo
read -p "Press any key to start the script"
echo

# -- Intro --

clear

# -- Script Dir --
 
# Taking in Caller's home directory to prevent installing onto /root
REAL_USER="${SUDO_USER:-$USER}"
REAL_HOME=$(getent passwd "$REAL_USER" | cut -d: -f6)
TARGET_DIR="$REAL_HOME/ams"

echo
echo -- Script Dir --
echo Setting up Script Directory...
echo ----------------
echo

sleep 2

mkdir -p "$TARGET_DIR"
chown "$REAL_USER:$REAL_USER" "$TARGET_DIR"
cd "$TARGET_DIR"
echo Directory Created : $TARGET_DIR

sleep 4

# -- Script Dir --

clear

# -- Java --
echo
echo -- Java --
echo Installing Required Java Versions...
echo ----------
echo

sleep 2

# Requires Sudo
# default-jdk = Java 21
# openjdk-25-jdk = Java 25 (experimental version)

apt install default-jdk openjdk-25-jdk -y

sleep 4

# -- Java --

clear

# -- Download --
echo
echo -- Download --
echo Downloading MC Server 26.1.1 From Minecraft.net
echo --------------
echo

sleep 2

# Given link is the direct link to download the .jar file

curl -o $TARGET_DIR/server.jar https://piston-data.mojang.com/v1/objects/49c8195703ad0ba4f0a4efbccfd85a4a8ca57431/server.jar

sleep 4

# -- Download --

clear

# -- Server --
echo
echo -- Server --
echo "Setting up Server & and its properties..."
echo ------------
echo

# Changes Below :
# eula=true >eula.txt
# motd=Made By ams.sh >server.properties

sleep 2

java -jar server.jar
sed -i 's/eula=false/eula=true/' eula.txt
sed -i 's/motd=A Minecraft Server/motd=Made By ams.sh/' server.properties

sleep 4

# -- Server --

clear

# -- Finish --
echo
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
echo
read -p "Press any key to finish..."
echo

# -- End --

clear
exit




