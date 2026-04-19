#!/bin/bash
# This script is licened under GNU 3.0 General Public License
# Script Version = v0.4
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
			echo "[VER] ams.sh v0.4"
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
	clear

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
		echo "Script Version : v0.4"
		echo "Minecraft Server Version : 26.1.1"
		echo "Made by Glaz (@glazzite)"
		echo ----------
		printf "\n"
		read -p "Press any key to start the script"
		printf "\n"

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


ram_allocate() {

	TOTAL_KB=$(grep MemTotal /proc/meminfo | awk '{print $2}') #Total RAM Kilobytes from /proc/meminfo
	TOTAL_GB=$(( TOTAL_KB / 1024 / 1024 )) # Convert to GB
	MAX_RAM=$(( TOTAL_GB - 1 )) # Reserve 1GB for System

	if [ "$MAX_RAM" -le 4 ]; then

		REC_GB=$(( $MAX_RAM - 1 )) # For 4GB or less, leave 1GB for the OS

	elif [ "$MAX_RAM" -le 8 ]; then

		REC_GB=$(( $MAX_RAM - 2 )) # For 8GB, 4-6GB is usually the sweet spot

	elif [ "$MAX_RAM" -le 16 ]; then

		REC_GB=$(( $MAX_RAM - 4 )) # For 16GB, 12GB is plenty for most servers

	else

		# For high-spec, leave 25% or cap it (MC often hits diminishing returns above 16G)
		REC_GB=$(( $MAX_RAM * 75 / 100 ))

fi

# Ensure we don't result in 0 or negative (safety check)
if [ "$REC_GB" -lt 1 ]; then REC_GB=1; fi


	if [ "$silent" = true ]; then

		echo "[SILENT] Detecting System RAM for Allocation"
		echo "[AMS] RAM Variable Updated"

		if [ "$recommended" = true ]; then
			echo "[AMS] Applying Recommended RAM"

				REC_RAM=$REC_GB

			echo "[AMS] Recommened RAM Allocated"

		else

			if [ -z "$RAM_SET" ]; then

				echo "[SILENT] Detecting System RAM for Allocation"
				echo "[AMS] Total System RAM : ${TOTAL_GB}GB"
				echo "[AMS] Usable System RAM : ${MAX_RAM}GB"

				while true; do

					read -p "[AMS] Enter RAM amount in GB: " USER_RAM

						# 1. Check if it's a number
						if ! [[ "$USER_RAM" =~ ^[0-9]+$ ]]; then
							echo "--> Error: Please enter a whole number (e.g., 8)."
							printf "\n"
						continue # Restarts the loop
						fi

						# 2. Check if it exceeds Max RAM
						if [ "$USER_RAM" -gt "$MAX_RAM" ]; then
							echo "--> Error: Exceeded System RAM. Max allowed is ${MAX_RAM}GB."
							printf "\n"
						continue # Restarts the loop
						fi

						# 3. If it passes both, set and break
						RAM_SET=$USER_RAM
						echo "Success: RAM set to ${RAM_SET}GB."
						break # This exits the WHILE loop so the script can continue
				done

			fi
		fi

	else

		clear
		printf "\n"
		echo -- Allocation --
		echo Detecting System RAM
		echo --------------
		printf "\n"
		sleep 2
		echo -- RAM --
		echo "Total System RAM : $TOTAL_GB"
		echo "Usable Amount : $MAX_RAM"
		echo ----------
		sleep 2


			if [ "$recommended" = true ]; then

				echo "-- -r Option --"
				echo "Automatically Choosing Recommened RAM"
				echo -----------------
				printf "\n"
				sleep 1
				echo -- RAM --
				echo "Amount Chosen : $REC_GB"
				echo ---------
				sleep 2
				REC_RAM=$REC_GB

			else

				echo -- Choosing --
				echo Choose whether to use Recommened or User-chosen
				echo --------------
				printf "\n"
				sleep 2
				while true; do

					clear
					echo --------------
					echo "Recommended RAM : $REC_GB"
					echo "Maximum Usable RAM : $MAX_RAM"
					echo ---------------
					printf "\n"
					sleep 1
					read -p "Recommended (y) or User-Chosen (n) [y/n] : " PICKRAM

					case "$PICKRAM" in

						[Yy]*)
								clear
								printf "\n"
								echo "Proceeding with recommended settings..."
								sleep 2
								REC_RAM=$REC_GB
								sleep 2
								break
								;;

						[Nn]*)
								clear
								printf "\n"
								echo "Manual selection triggered."
								sleep 2

								while true; do
										read -p "[AMS] Enter RAM amount in GB: " USER_RAM

										if ! [[ "$USER_RAM" =~ ^[0-9]+$ ]]; then
											echo "--> Error: Please enter a valid number."
										elif [ "$USER_RAM" -gt "$MAX_RAM" ]; then
											echo "--> Error: Exceeded System RAM. Max is ${MAX_RAM}GB."
										else
											RAM_SET=$USER_RAM
											break 2 # "break 2" exits BOTH the inner while and the outer while loop
										fi
								done
								;;

							*)
								clear
								echo "Invalid input: '$PICKRAM'. Please enter 'y' for yes or 'n' for no."
								echo ""
								sleep 1
								;;
					esac
				done
			fi
	fi
}


startsh() {

	if [ "$silent" = true ]; then

		echo "[SILENT] Creating start.sh"
		echo "#!/bin/bash" >> start.sh # Shellbang

		if [ "$recommended" = true ]; then

			echo "[AMS] Applying Recommended Settings"

				echo "RAM=$REC_RAM" >> start.sh
				printf "\n" >> start.sh
				echo "java -Xmx${REC_RAM}G -Xms${REC_RAM}G -jar ${TARGET_DIR}/server.jar" >> start.sh

			echo "[AMS] Recommended Settings Applied"

		else

			echo "[AMS] Applying Chosen Settings"

				echo "RAM=$RAM_SET" >> start.sh
				printf "\n" >> start.sh
				echo "java -Xmx${RAM_SET}G -Xms${RAM_SET}G -jar $TARGET_DIR/sever.jar" >> start.sh

			echo "[AMS] Chosen Settings Applied"

		fi

		chmod 755 $TARGET_DIR/start.sh > /dev/null 2>&1
		chmod +x $TARGET_DIR/start.sh > /dev/null 2>&1

		echo "[AMS] start.sh is now executuble"

	else

		clear
		printf "\n"
		echo -- start.sh --
		echo Creating Start.sh
		echo --------------
		printf "\n"
		sleep 2
		echo "#!/bin/bash" >> start.sh
		sleep 1

		if [ "$recommended" = true ]; then

			echo -- Recommened --
			echo "[AMS] Applying Recommended Settings"
			echo ---------------
			printf "\n"

								echo "RAM=$REC_RAM" >> start.sh
								printf "\n" >> start.sh
								echo "java -Xmx${REC_RAM}G -Xms${REC_RAM}G -jar $TARGET_DIR/server.jar" >> start.sh

			sleep 2
			echo -- Done --
			echo "[AMS] Recommended Settings Applied"
			echo ----------
			printf "\n"
			sleep 4

		else

			echo -- Chosen --
			echo "[AMS] Applying Chosen Settings"
			echo ------------
			printf "\n"

								echo "RAM=$RAM_SET" >> start.sh
								printf "\n" >> start.sh
								echo "java -Xmx${RAM_SET}G -Xms${RAM_SET}G -jar $TARGET_DIR/sever.jar" >> start.sh

			sleep 2
			echo -- Done --
			echo "[AMS] Chosen Settings Applied"
			echo ----------
			sleep 4

		fi

		chmod 755 $TARGET_DIR/start.sh
		chmod +x $TARGET_DIR/start.sh

		printf "\m"

		echo -- Ready --
		echo "[AMS] start.sh is now executuble"
		echo -----------

		sleep 4

	fi

}


finish() {

	if [ "$silent" = true ]; then

		echo "[SILENT] Your MC Server is located in $TARGET_DIR"
		echo "[SILENT] To Start, run start.sh in $TARGET_DIR/start.sh"
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
		echo "To start your server, please execute the start.sh file found in : "
		echo $TARGET_DIR/start.sh
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
ram_allocate
startsh
finish
stop

# -- End --
