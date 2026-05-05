#!/bin/bash

: '
Automated Minecraft Server - ams.sh

-> Linux (Ubuntu/Debain)
-> Minecraft Java Edition
-> Script Version = v0.6
-> MC Server Version = 26.1.1

This script is licened under GNU 3.0 General Public License
> Terminal : {directory}/ams.sh -l
> More info in https://www.gnu.org/licenses/

Made by Glaz
@Glazzite
'

# -- Color --

# Reset
NC='\033[0m'       # No Color

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Background
BGBlack='\033[40m'       # Black
BGRed='\033[41m'         # Red
BGGreen='\033[42m'       # Green
BGYellow='\033[43m'      # Yellow
BGBlue='\033[44m'        # Blue
BGPurple='\033[45m'      # Purple
BGCyan='\033[46m'        # Cyan
BGWhite='\033[47m'       # White


# -- Flags/Options --

while getopts 'rushvlc' option; do
	case $option in

		# Variable-Based
		r) recommended=true ;; # Uses Recommended Configs for Server
		u) update=true ;; # Updates the Script
		s) silent=true ;; # Hides all UI and gives simple prompts instead

		h)	# Help/Manual
			printf "\n"
			echo -e "[${BBlue}AMS${NC}] ${BGreen}Help/Manual${NC}"
			echo -e "[${BBlue}USAGE${NC}] sudo {directory}/ams.sh [Option]"

			printf "\n"

			echo -e "${BYellow}Flags/Options${NC} :"

			printf "\n"

			echo -e	"-s -> ${Yellow}Silent${NC}"
			echo 		"Silents all outputs and produces a simpler output instead"
			printf "\n"

			echo -e	"-r -> ${Green}Recommended${NC}"
			echo		"Auto-selects all recommended settings without any user interaction."
			echo		"Pairs best with -s (silent)"
			printf "\n"

			echo -e "-l -> ${Cyan}License${NC}"
			echo 		"Provides the licence in use of the script."
			printf "\n"

			echo -e	"-c -> ${Red}Changelog${NC}"
			echo		"Displays the script's change log over versions."
			printf "\n"

			echo -e	"-u -> ${Purple}Update${NC}"
			echo		"Updates the script to the latest version available via Git"
			printf "\n"

			echo -e	"-h -> ${Blue}Help${NC}"
			echo		"Displays this help guide"
			printf "\n"

			exit 0
			;;

		v)	# Version of the Script
			printf "\n"
			echo -e "[${BBlue}VER${NC}] ams.sh v0.6"
			echo -e "[${BYellow}STATUS${NC}] Alpha"
			printf "\n"
			exit 0
			;;

		l)	# Licensing Info
			printf "\n"
			echo -e "${BGreen}GNU 3.0 General Public License${NC}

ams.sh Copyright (C) 2026  Glazzite
This program comes with ${Red}ABSOLUTELY NO WARRANTY${NC};
This is ${Green}free software${NC}, and you are welcome to ${Yellow}redistribute it${NC}
under ${Red}certain conditions${NC}.
More info in ${Blue}https://www.gnu.org/licenses/${NC}
"
			exit 0
			;;

		c)	#changelog
			printf "\n"
			echo -e "${BGreen}Changelog of ams.sh${NC}

${BGreen}v0.6${NC} [May 5 2026]
${BBlue}Decor${NC}

Added Color Variables for UI
Added Changelog Option [ -c ]
Added License Option [ -l ]
Cleaned Up Code


${BGreen}v0.5${NC} [April 20 2026]
${BRed}Error Handling${NC}

Added Error Handling for All Functions
start() : 70+ Lines -> <30 Lines
Fixed Typos


${BGreen}v0.4${NC} [April 19 2026]
${BPurple}Ram Allocation + start.sh${NC}

Added Ram Allocation Logic
Both Recommended & User-Choice
Full Support with -sr options
Loops & Cases was used
Added of Creation of start.sh (which is a script preconfigured with the flags appropriate to the user to run the server)
Full Script is Usable Again


${BGreen}v0.3${NC} [April 5 2026]
${BCyan}Flags/Options${NC}

Added Flag/Option Support
Flags : -h -r -u -s -v
Cleaned up Output Echo
Removed a few comments


${BGreen}v0.2${NC} [April 4 2026]
${BWhite}Functions${NC}

Added function support for important segments
Removed # -- XYZ -- comments


${BGreen}v0.1${NC} [April 4 2026]

v0.1 has been released.
Basic Bash Script
"
			exit 0
			;;

		*)	# Missed/Invalid Option
			printf "\n"
			echo -e "[${BBlue}AMS${NC}] Invalid Option Used."
			echo -e "[${BBlue}USAGE${NC}] sudo {directory}/ams.sh [Option]"
			echo -e "[${BGreen}HELP${NC}] Use option -h to for help"
			printf "\n"
			exit 0
			;;
	esac
done



# -- Functions --


banner() {
	clear

	if [ "$silent" = true ]; then

		echo -e "[${BYellow}SILENT${NC}] Banner Art ${Red}Skipped${NC}"

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

		echo -e "[${BYellow}SILENT${NC}] Intro ${Red}Skipped${NC}"

	else

		printf "\n"
		echo -- Intro --
		echo -e "${Green}AMS.sh${NC} - ${BGreen}Automated Minecraft Server${NC}"
		echo -e "This script will ${Green}automate an entire setup${NC} of a default, ${Blue}vanilla Minecraft server${NC}"
		echo -e "...in just a ${BRed}single script${NC}."
		echo ----------
		echo
		read -p "Press any key to continue..."
		echo
		echo -- Licensing --
		echo -e "This script is ${BGreen}licened${NC} under ${BCyan}GNU 3.0 General Public License${NC}"
		echo -e "For info > ${Blue}https://www.gnu.org/licenses/${NC}"
		echo --------------
		echo
		read -p "Press any key to continue..."
		echo
		echo -- Info --
		echo -e "OS :${BYellow}Linux${NC} (${Yellow}Ubuntu${NC}/${Red}Debian${NC})"
		echo -e "Script ${BYellow}Version${NC} : ${Green}v0.6${NC} (${Yellow}Alpha${NC})"
		echo -e "Minecraft ${BYellow}Server Version${NC} : ${Green}26.1.1${NC}"
		echo -e "Made by ${BWhite}Glaz${NC} (${Blue}@glazzite${NC})"
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


	if [ -z "$REAL_HOME" ]; then
		echo -e "[${BRed}ERROR${NC}] Home Directory for $REAL_USER Cannot be Found" >&2
		exit 1
	fi

	TARGET_DIR="$REAL_HOME/ams"
	mkdir -p "$TARGET_DIR" || { echo -e "[${BRed}ERROR${NC}] Failed to create $TARGET_DIR"; exit 1; }

	if [ "$EUID" -eq 0 ]; then
		chown "$REAL_USER:$REAL_USER" "$TARGET_DIR" || { echo -e "[${BRed}ERROR${NC}] Failed to set permissions"; exit 1; }
	fi

	cd "$TARGET_DIR" || { echo -e "[${BRed}ERROR${NC}] Could not enter $TARGET_DIR"; exit 1; }

	# UI Output
	if [ "$silent" = true ]; then

		echo -e "[${BYellow}SILENT${NC}] Directory ${Green}ready${NC} at ${BBlue}${TARGET_DIR}${NC}"

	else

		clear
		printf "\n"
		echo -- Script Dir --
		echo -e "${BGreen}Setting up Script Directory${NC}..."
		echo ----------------
		printf "\n"
		sleep 1
		echo -e "[${BBlue}AMS${NC}] Directory ${Green}Created & Verified${NC} : ${BBlue}${TARGET_DIR}${NC}"
		sleep 2

	fi
}

install_java() {

	if [ "$silent" = true ]; then

		echo -e "[${BYellow}SILENT${NC}] ${Green}Updating${NC} package lists..."
        apt-get update -y > /dev/null 2>&1
		echo -e "[${BYellow}SILENT${NC}] ${Yellow}Installing${NC} Java Runtime"
		apt-get install default-jdk openjdk-25-jdk -y > /dev/null 2>&1 || { echo "[${BRed}ERROR${NC}] Java installation failed"; exit 1; }
		echo -e "[${BYellow}SILENT${NC}] Java ${Green}Installed${NC}"

	else

		clear
		printf "\n"
		echo -- Update --
		echo -e "${BGreen}Updating Package Repository${NC}"
		echo ------------
        apt-get update -y
		sleep 1
		printf "\n"
		echo -- Java --
		echo -e "${BGreen}Installing Required Java Versions${NC}..."
		echo ----------
		printf "\n"
		sleep 2
		# Requires Sudo
		# default-jdk = Java 21
		# openjdk-25-jdk = Java 25 (experimental version)
		if apt-get install default-jdk openjdk-25-jdk -y; then
            echo -e "[${BBlue}AMS${NC}] Java versions ${Green}installed${NC}."
            sleep 2
        else
            echo -e "[${BRed}ERROR${NC}] Failed to install Java packages." >&2
            exit 1
        fi
		sleep 1

	fi
}

download_mcserver() {

	local JAR_URL="https://piston-data.mojang.com/v1/objects/49c8195703ad0ba4f0a4efbccfd85a4a8ca57431/server.jar"
	local JAR_PATH="$TARGET_DIR/server.jar"

	if [ "$silent" = true ]; then

		echo -e "[${BYellow}SILENT${NC}] ${Yellow}Downloading${NC} server.jar"
		curl -fsSl -o "$JAR_PATH" "$JAR_URL" || { echo "[${BRed}ERROR${NC}] Download failed"; exit 1; }
		echo -e "[${BYellow}SILENT${NC}] server.jar ${Green}Downloaded${NC}"

	else

		clear
		printf "\n"
		echo -- Download --
		echo -e "${BGreen}Downloading MC 26.1.1 Server.jar${NC}"
		echo --------------
		printf "\n"
		sleep 2
		# Given link is the direct link to download the .jar file
		if curl -fL --progress-bar -o "$JAR_PATH" "$JAR_URL"; then
            echo -e "[${BBlue}AMS${NC}] Download ${Green}Complete${NC}: $JAR_PATH"
            sleep 2
        else
            echo -e "[${BRed}ERROR${NC}] Failed to download server.jar. Check your internet." >&2
            exit 1
        fi
		sleep 2

	fi

	if [ ! -s "$JAR_PATH" ]; then
        echo -e "[${BRed}ERROR${NC}] Downloaded file is empty or missing!" >&2
        exit 1
    fi

}

mcserver() {

	local EULA="eula.txt"
    local PROP_FILE="server.properties"

	if [ "$silent" = true ]; then

		echo -e "[${BYellow}SILENT${NC}] ${Yellow}Setting up${NC} MC Server"
		java -Xmx1024M -Xms1024M -jar server.jar > /dev/null 2>&1

		if [ ! -f "$EULA" ]; then
            echo -e "[${BRed}ERROR${NC}] eula.txt was not generated!" >&2
            exit 1
        fi

		sed -i 's/eula=false/eula=true/' "$EULA"
		sed -i 's/motd=.*/motd=Made By ams.sh/' "$PROP_FILE" 2>/dev/null
		echo -e "[${BYellow}SILENT${NC}] EULA ${Green}Accepted${NC} & MOTD ${Green}set${NC}."



	else

		clear
		printf "\n"
		echo -- Server --
		echo -e "${BGreen}Setting up Server & and its properties...${NC}"
		echo ------------
		printf "\n"

		# Changes Below :
		# eula=true >eula.txt
		# motd=Made By ams.sh >server.properties

		sleep 2
		java -Xmx1024M -Xms1024M -jar server.jar

		if [ -f "$EULA_FILE" ]; then
            echo -e "[${BBlue}AMS${NC}] ${Green}Accepting${NC} EULA and ${Yellow}customizing${NC} properties..."
            sed -i 's/eula=false/eula=true/' "$EULA"

            if [ -f "$PROP_FILE" ]; then
                sed -i 's/motd=.*/motd=Made By ams.sh/' "$PROP_FILE"
            fi

            echo -e "[${BBlue}AMS${NC}] Setup ${Green}Complete${NC}!"
            sleep 2
        else
            echo -e "[${BRed}ERROR${NC}] Server failed to generate $EULA" >&2
            exit 1
        fi
		sleep 2

	fi
}


ram_allocate() {

	TOTAL_KB=$(grep MemTotal /proc/meminfo | awk '{print $2}') #Total RAM Kilobytes
	TOTAL_GB=$(( TOTAL_KB / 1024 / 1024 )) # Convert to GB
	MAX_RAM=$(( TOTAL_GB - 1 )) # Reserve 1GB for System

	if [ "$MAX_RAM" -le 4 ]; then
		REC_GB=$(( $MAX_RAM - 1 )) # For 4GB
	elif [ "$MAX_RAM" -le 8 ]; then
		REC_GB=$(( $MAX_RAM - 2 )) # For 8GB
	elif [ "$MAX_RAM" -le 16 ]; then
		REC_GB=$(( $MAX_RAM - 4 )) # For 16GB
	else
		# For high-spec, leave 25% or cap it (MC often hits diminishing returns above 16G)
		REC_GB=$(( $MAX_RAM * 75 / 100 ))
	fi

# Ensure result NOT be 0 or negative
	if [ "$REC_GB" -lt 1 ]; then REC_GB=1; fi


	if [ "$silent" = true ]; then

		echo -e "[${BYellow}SILENT${NC}] Detecting System RAM for ${Yellow}Allocation${NC}"
		echo -e "[${BBlue}AMS${NC}] RAM Variable ${Green}Updated${NC}"

		if [ "$recommended" = true ]; then
			echo -e "[${BBlue}AMS${NC}] ${Yellow}Applying${NC} Recommended RAM"

				REC_RAM=$REC_GB

			echo -e "[${BBlue}AMS${NC}] Recommened RAM ${Green}Allocated${NC}"

		else

			if [ -z "$RAM_SET" ]; then

				echo -e "[${BYellow}SILENT${NC}] Detecting ${Yellow}System RAM${NC} for ${Green}Allocation${NC}"
				echo -e "[${BBlue}AMS${NC}] ${Blue}Total${NC} System RAM : ${TOTAL_GB}GB"
				echo -e "[${BBlue}AMS${NC}] ${Purple}Usable${NC} System RAM : ${MAX_RAM}GB"

				while true; do

					read -p "Enter RAM amount in GB: " USER_RAM

						# 1. Check if it's a number
						if ! [[ "$USER_RAM" =~ ^[0-9]+$ ]]; then
							echo -e "[${BRed}ERROR${NC}] Please enter a whole number (e.g., 8)."
							printf "\n"
						continue # Restarts the loop
						fi

						# 2. Check if it exceeds Max RAM
						if [ "$USER_RAM" -gt "$MAX_RAM" ]; then
							echo -e "[${BRed}ERROR${NC}] Exceeded System RAM. Max allowed is ${MAX_RAM}GB."
							printf "\n"
						continue # Restarts the loop
						fi

						# 3. If it passes both, set and break
						RAM_SET=$USER_RAM
						echo -e "[${BBlue}AMS${NC}] RAM set to ${RAM_SET}GB."
						break # This exits the WHILE loop so the script can continue
				done

			fi
		fi

	else

		clear
		printf "\n"
		echo -- Allocation --
		echo -e "${BGreen}Detecting System RAM${NC}"
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
				echo -e "${BGreen}Automatically Choosing Recommened RAM${NC}"
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
				echo -e "${BGreen}Choose whether to use Recommened or User-chosen${NC}"
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
								echo -e "[${BBlue}AMS${NC}] Proceeding with ${Greemn}recommended${NC} settings..."
								sleep 2
								REC_RAM=$REC_GB
								sleep 2
								break
								;;

						[Nn]*)
								clear
								printf "\n"
								echo -e "[${BBlue}AMS${NC}] ${Yellow}Manual${NC} selection triggered."
								sleep 2

								while true; do
										read -p "Enter RAM amount in GB: " USER_RAM

										if ! [[ "$USER_RAM" =~ ^[0-9]+$ ]]; then
											echo -e "[${BRed}ERROR${NC}] Please enter a valid number."
										elif [ "$USER_RAM" -gt "$MAX_RAM" ]; then
											echo -e "[${BRed}ERROR${NC}] Exceeded System RAM. Max is ${MAX_RAM}GB."
										else
											RAM_SET=$USER_RAM
											break 2 # "2" = Exits BOTH the inner while and the outer while loop
										fi
								done
								;;

							*)
								clear
								echo -e "[${BRed}ERROR${NC}] '$PICKRAM'. Please enter 'y' for yes or 'n' for no."
								echo ""
								sleep 1
								;;
					esac
				done
			fi
	fi
}


startsh() {

	local SCRIPT_FILE="$TARGET_DIR/start.sh"
	local FINAL_RAM

	if [ "$recommended" = true ]; then
		FINAL_RAM="$REC_RAM"
	else
		FINAL_RAM="$RAM_SET"
	fi

	if [ -z "$FINAL_RAM" ]; then
        echo -e "[${BRed}ERROR${NC}] RAM value is missing. Cannot create start.sh" >&2
        exit 1
    fi


	cat <<EOF > "$SCRIPT_FILE"
#!/bin/bash
# Generated by AMS.sh
RAM=${FINAL_RAM}
java -Xmx\${RAM}G -Xms\${RAM}G -jar "$TARGET_DIR/server.jar"
EOF

	chmod +x "$SCRIPT_FILE" || { echo -e "[${BRed}ERROR${NC}] Failed to make start.sh executable"; exit 1; }


	if [ "$silent" = true ]; then
        echo -e "[${BYellow}SILENT${NC}] start.sh created with ${Green}${FINAL_RAM}GB RAM${NC}"
    else
        clear
        echo "-- Start.sh ----"
        echo -e "${BGreen}Creating Launcher${NC}"
        echo "----------------"
        sleep 1
        echo "Settings: ${FINAL_RAM}GB RAM"
        echo "Path: $SCRIPT_FILE"
        echo "----------------"
        echo -e "[${BBlue}AMS${NC}] start.sh is ready!"
        sleep 2
    fi


}


finish() {

	if [ "$silent" = true ]; then

		echo -e "[${BYellow}SILENT${NC}] Your MC Server is located in ${BBlue}${TARGET_DIR}${NC}"
		echo -e "[${BYellow}SILENT${NC}] To Start, run start.sh in ${BBlue}${TARGET_DIR}/start.sh${NC}"
		echo -e "[${BYellow}SILENT${NC}] More Settings in ${BBlue}server.properties${NC}"

	else

		clear
		printf "\n"
		echo -- Script Done --
		echo -e "Your Minecraft Server is ${Green}Ready${NC}!"
		echo -e "Your Minecraft Server is located in ${BBlue}${TARGET_DIR}${NC}"
		echo ------------------
		echo
		read -p "Press any key to continue..."
		echo
		echo -- Start Server --
		echo -e "To ${Yellow}start your server${NC}, please execute the start.sh file found in : "
		echo -e "$TARGET_DIR"/start.sh
		echo -- More --
		echo -e "More Settings related to the server in ${Blue}server.properties${NC}"
		echo ------------------
		printf "\n"
		read -p "Press any key to finish..."
		printf "\n"

	fi
}

stop() {

	if [ "$silent" = true ]; then

		echo -e "[${BYellow}SILENT${NC}] Thank you."
		exit 0

	else

		clear
		echo -e "[${BBlue}AMS${NC}] adioso~"
		exit 0

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
