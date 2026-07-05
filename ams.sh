#!/bin/bash

# ─────────── [ ams.sh ] ─────────────────────────────────
# Absolute Minecraft Strap (ams) v1.0
# Made by Glaz @Glazzite
# ────────────── [ Info ] ────────────────────────────────
# Last Edited : July 5 2026
# Purely on Bash/Shell
# Licened under GNU 3.0 General Public License
# >> https://www.gnu.org/licenses/
# ────────────────────────────────────────────────────────

# ────────────── [ Linux Check ] ─────────────────────────

if [ "$(uname)" != "Linux" ]; then
    echo -e "${BRed}[FATAL ERROR]${NC} AMS is exclusively for Linux environments."
    exit 1
fi

# ──────────────── [ UI ] ────────────────────────────────

# ───────── [ Color ] ────────────

NC='\033[0m'       # No Color

# Regular Colors
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'

# Bold
BBlack='\033[1;30m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'

# ───────── [ Center ] ────────────

text() {

    local text="$1"
    local width=${COLUMNS:-$(tput cols 2>/dev/null || echo 80)}         # Takes the Terminal's current width using either COLUMS, tput or assuming it is 80 via echo

    local clean_text=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')     # This strips out the invisible characters that Color Variables uses, so it won't be counted as width
    local text_len=${#clean_text}

    if [ "$text_len" -ge "$width" ]; then              # If the text is greater than the width of the Terminal, then it will just return back, it won't crash the terminal
        echo -e "$text"
        return
    fi

    local padding=$(( (width - text_len) / 2 ))       # Calculating the padding required to get the input centered.

    printf "%${padding}s" ""             # Apply said padding as nothing (as in spaces)
    echo -e "$text"

}

# ──────────────── [ Flags ] ─────────────────────────────

while getopts 'hvlc' options; do
    case $options in

		h)	# Help/Manual
			printf "\n"
			echo -e "    [${BWhite}AMS${NC}] ${BGreen}Help/Manual${NC}"
			echo -e "    [${BBlue}USAGE${NC}] {directory}/ams.sh [Option]"

			printf "\n"

			echo -e "        ${BYellow}Flags${NC} :"
			printf "\n"

			echo -e "    -l -> ${Cyan}Licence${NC}"
			echo 	   "   Provides the licence in use of the script."
			printf "\n"

			echo -e	"    -c -> ${Red}Changelog${NC}"
			echo		"  Displays the script's change log over versions."
			printf "\n"

			echo -e	"    -u -> ${Purple}Update${NC} [HASNT BEEN IMPLEMENTED YET]"
			echo		"  Updates the script to the latest version available via Git."
			printf "\n"

			echo -e	"    -h -> ${Blue}Help${NC}"
			echo		"  Displays this help guide."
			printf "\n"
            printf "\n"
			exit 0
			;;

		v)	# Version of the Script
			printf "\n"
			echo -e "    [${BBlue}VER${NC}] ams.sh v1.0"
			echo -e "    [${BYellow}STATUS${NC}] Release"
			printf "\n"
			exit 0
			;;

		l)	# Licensing Info
			printf "\n"
			echo -e "        ${BGreen}GNU 3.0 General Public License${NC}

        Absolute Minecraft Strap Copyright (C) 2026 Glazzite
        This program comes with ${Red}ABSOLUTELY NO WARRANTY${NC};
        This is ${Green}free software${NC}, and you are welcome to ${Yellow}redistribute it${NC}
        under ${Red}certain conditions${NC}.
        More info in ${Blue}https://www.gnu.org/licenses/${NC}
"
			exit 0
			;;

		c)	# Changelog
			printf "\n"
			echo -e "        ${BGreen}Changelog of ams.sh${NC}

    ${BGreen}v0.1${NC} [April 4 2026]

        v0.1 has been released.
        Basic Bash Script

    ${BGreen}v0.2${NC} [April 4 2026]
    ${BWhite}Functions${NC}

        Added function support for important segments
        Removed # -- XYZ -- comments

    ${BGreen}v0.3${NC} [April 5 2026]
    ${BCyan}Flags/Options${NC}

        Added Flag/Option Support
        Flags : -h -r -u -s -v
        Cleaned up Output Echo
        Removed a few comments

    ${BGreen}v0.4${NC} [April 19 2026]
    ${BPurple}Ram Allocation + start.sh${NC}

        Added Ram Allocation Logic
        Both Recommended & User-Choice
        Full Support with -sr options
        Loops & Cases was used
        Added of Creation of start.sh
        Full Script is Usable Again

    ${BGreen}v0.5${NC} [April 20 2026]
    ${BRed}Error Handling${NC}

        Added Error Handling for All Functions
        start() : 70+ Lines -> <30 Lines
        Fixed Typos

    ${BGreen}v0.6${NC} [May 5 2026]
    ${BBlue}Decor${NC}

        Added Color Variables for UI
        Added Changelog Option [ -c ]
        Added License Option [ -l ]
        Cleaned Up Code

    ${BGreen}v1.0${NC} [July 5 2026]
    ${BYellow}Release$NC

        ams.sh was renamed to 'Absolute Minecraft Strap'.
        ams.sh was moved to 'Release' status.
        Complete Redo from scratch

        ──────────── [ UI ] ─────────────
        Massive UI Overhaul.
        Centered UI Elements via 'text()' function.
        Replaced '----' to '───'.
        Added Interactive Pages for user inputs beforehand.
        Comments were added.
        Proper divisions of code was implemented.

        ───── [ Extended Support ] ──────
        Engines/API Accessed JAR Downloading were added.
        Vanilla / Fabric / Paper support was introduced.
        Multi-MC Version support was introduced.
        apt / dnf / pacman / yay support was introduced.

        ───────── [ Bug Fixes ] ──────────
        Superuser bug was fixed using "sudo -v".
        It is not required to use sudo with ams.sh anymore.

        ─────────── [ Misc. ] ─────────────
        Environment parameters for creating a directory was removed.
        RAM Allocation logic was simplified.
        run.sh was simplified.
        Pre-defined Variables was introduced.
        ASCII art was changed to 'Diamfont'.
        New PKGs to Install : java, jq
        Starting comment was reduced.
        Background Color Variables was removed.
        Silent & Recommended Flags were removed.
        Spacing was made in Flags.
        Changelog order was reversed.
        Small licensing change to accompany the new name.


"
			exit 0
			;;

		*)	# Missed/Invalid Option
			printf "\n"
			echo -e "    [${BWhite}AMS${NC}] Invalid Option Used."
			echo -e "    [${BBlue}USAGE${NC}] {directory}/ams.sh [Option]"
			echo -e "    [${BGreen}HELP${NC}] Use option -h to for help"
			printf "\n"
			exit 0
			;;
	esac
done


# ───────────── [ Variables ] ────────────────────────────

mc_version=""
loader=""
pkgmgr=""
final_ram=""
server="$HOME/ams"


# ───────────── [ Functions ] ────────────────────────────

# ────────── [ Start ] ────────────

intro() {

	clear
	printf "\n\n\n"
	text "Absolute Minecraft Strap 1.0"
	text "───────────────────────────────────────────────────────"
	text "${BWhite} ▗▄▖ ▗▖  ▗▖ ▗▄▄▖"
	text "▐▌ ▐▌▐▛▚▞▜▌▐▌   "
	text "▐▛▀▜▌▐▌  ▐▌ ▝▀▚▖"
	text "▐▌ ▐▌▐▌  ▐▌▗▄▄▞▘${NC}"
	printf "\n"
	text "────────────────────── [ Info ] ───────────────────────"
	printf "\n"
	text "${BGreen}Fastest way${NC} to ${BBlue}bootstrap a Minecraft server${NC} on Linux."
	text "Made by ${BWhite}Glaz @Glazzite${NC} on ${Green}GitHub/YT/X${NC}"
	text "${BYellow}Make sure to be connected to the Internet before use!${NC}"
	printf "\n"
	text "───────────────────── [ Licence ] ─────────────────────"
	printf "\n"
	text "${BGreen}Licened${NC} under ${BCyan}GNU 3.0 General Public License${NC}"
	text "For info > ${Blue}https://www.gnu.org/licenses/${NC}"
	printf "\n"
	text "─── [ Proceed Here ] ──────────────────────────────────"
	printf "\n"
	printf "%26s" "" && read -p "Press Enter to continue... "
	printf "\n\n"

}

# ───────── [ Config ] ────────────

page1_loader() {

	clear
	printf "\n\n\n"
	text "ams 1.0"
	text "───────────────────────────────────────────────────────"
	text "${Cyan}▗▖    ▗▄▖  ▗▄▖ ▗▄▄▄  ▗▄▄▄▖▗▄▄▖ "
	text "▐▌   ▐▌ ▐▌▐▌ ▐▌▐▌  █ ▐▌   ▐▌ ▐▌"
	text "▐▌   ▐▌ ▐▌▐▛▀▜▌▐▌  █ ▐▛▀▀▘▐▛▀▚▖"
	text "▐▙▄▄▖▝▚▄▞▘▐▌ ▐▌▐▙▄▄▀ ▐▙▄▄▖▐▌ ▐▌${NC}"
	printf "\n"
	text "────────────────────── [ Info ] ───────────────────────"
    printf "\n"
    text "Pick which ${BGreen}Loader${NC} you wnat for ${BYellow}your${NC} Server."
	text "Loader, as in, ${BBlue}Vanilla${NC} / ${BWhite}Fabric${NC} / ${BPurple}Paper${NC}."
	text "If you ${BYellow}chose nothing${NC}, it will ${BRed}default${NC} to ${BGreen}Vanilla${NC}"
	printf "\n"
	text "───────────────────── [ Options ] ─────────────────────"
	printf "\n"
	text "[1] ${BBlue}Vanilla${NC} / ${BYellow}Snapshots${NC}"
	text "[2] ${BWhite}Fabric${NC}             "
	text "[3] ${BPurple}Paper${NC}              "
	printf "\n"
	text "─── [ Choose Here ] ───────────────────────────────────"
	printf "\n"
	printf "%26s" "" && read -p "Loader [1-3] : " pickloader
	printf "\n\n"

	case $pickloader in

		2) loader="fabric" ;;
		3) loader="paper" ;;
		*) loader="vanilla" ;;

	esac


}


page2_version() {

	clear
	printf "\n\n\n"
	text "ams 1.0"
	text "──────────────────────────────────────────────────────"
	text "${BGreen}▗▖  ▗▖ ▗▄▄▖    ▗▖  ▗▖▗▄▄▄▖▗▄▄▖  ▗▄▄▖▗▄▄▄▖ ▗▄▖ ▗▖  ▗▖"
	text "▐▛▚▞▜▌▐▌       ▐▌  ▐▌▐▌   ▐▌ ▐▌▐▌     █  ▐▌ ▐▌▐▛▚▖▐▌"
	text "▐▌  ▐▌▐▌       ▐▌  ▐▌▐▛▀▀▘▐▛▀▚▖ ▝▀▚▖  █  ▐▌ ▐▌▐▌ ▝▜▌"
	text "▐▌  ▐▌▝▚▄▄▖     ▝▚▞▘ ▐▙▄▄▖▐▌ ▐▌▗▄▄▞▘▗▄█▄▖▝▚▄▞▘▐▌  ▐▌${NC}"
	printf "\n"
	text "───────────────────── [ Info ] ───────────────────────"
	printf "\n"
	text "Enter the ${BGreen}Minecraft Version${NC} you want for ${BYellow}your${NC} Server."
	text "Regular ${BBlue}Releases${NC} & ${BPurple}Snapshots${NC} can be ${BGreen}entered${NC}."
	text "If you ${BYellow}typed nothing${NC}, it will ${BRed}default${NC} to ${BGreen}1.21.11${NC}"
	text "${Red}Snapshots can only be used in VANILLA${NC}"
	printf "\n"
	text "─── [ Enter Here ] ───────────────────────────────────"
	printf "\n"
	printf "%26s" "" && read -p "Version : " mc_version
	printf "\n\n"

		[ -z "$mc_version" ] && mc_version="1.21.11"

	printf "\n"

}


page3_pkg() {

	clear
	printf "\n\n\n"
	text "ams 1.0"
	text "───────────────────────────────────────────────────────"
	text "${Blue}▗▄▄▖ ▗▖ ▗▖ ▗▄▄▖▗▖  ▗▖ ▗▄▄▖▗▄▄▖ "
	text "▐▌ ▐▌▐▌▗▞▘▐▌   ▐▛▚▞▜▌▐▌   ▐▌ ▐▌"
	text "▐▛▀▘ ▐▛▚▖ ▐▌▝▜▌▐▌  ▐▌▐▌▝▜▌▐▛▀▚▖"
	text "▐▌   ▐▌ ▐▌▝▚▄▞▘▐▌  ▐▌▝▚▄▞▘▐▌ ▐▌${NC}"
	printf "\n"
	text "────────────────────── [ Info ] ───────────────────────"
	printf "\n"
	text "Pick your ${BPurple}distro's${NC}/${BWhite}desired${NC} package manager."
	text "This is to ${BBlue}install${NC} ${BGreen}Java${NC} & ${BYellow}Jq${NC} to operate properly."
	text "If you ${BYellow}typed nothing${NC}, it will ${BRed}default${NC} to ${BGreen}apt${NC}"
	printf "\n"
	text "───────────────────── [ Options ] ─────────────────────"
	printf "\n"
	text "[1] ${BGreen}apt${NC} - (Ubuntu/Debian)"
	text "[2] ${BBlue}dnf${NC} - (Fedora)       "
	text "[3] ${BWhite}pacman${NC} - (Arch)      "
	text "[4] ${BYellow}yay${NC} - (Arch AUR)     "
	printf "\n"
	text "─── [ Choose Here ] ───────────────────────────────────"
	printf "\n"
	printf "%26s" "" && read -p "PKG [1-4] : " pickpkg
	printf "\n\n"

		case $pickpkg in

			2) pkgmgr="dnf" ;;
			3) pkgmgr="pacman" ;;
			4) pkgmgr="yay" ;;
			*) pkgmgr="apt" ;;

		esac

}


page4_ram() {
    local error_msg=""
    local pickram=""
    local user_ram=""

    # It takes System RAM, take 1GB out for the system, and makes a recommendation for the user

    local total_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')      # Taking System RAM which will be in Kilobytes
    local total_gb=$(( total_kb / 1024 / 1024 ))                          # Divide given amount by 1024 two times to turn it into Gigabytes
    local max_ram=$(( total_gb - 1 ))                                     # Reserve 1GB for OS
    local rec_gb=1

		if [ "$max_ram" -le 4 ]; then             # For 4GB or less.
			rec_gb=$(( max_ram - 1 ))
		elif [ "$max_ram" -le 8 ]; then           # For 8GB or less.
				rec_gb=$(( max_ram - 2 ))
		elif [ "$max_ram" -le 16 ]; then          # For 16GB or less.
				rec_gb=$(( max_ram - 4 ))
		else
			rec_gb=$(( max_ram * 75 / 100 ))      # For 16GB or more.
		fi
			[ "$rec_gb" -lt 1 ] && rec_gb=1      # For Less than 1GB of Usable RAM

    while true; do 		 # 1st Loop : Recommended RAM
        clear
        printf "\n\n\n"
        text "ams 1.0"
        text "───────────────────────────────────────────────────────"
        text "${Red}▗▄▄▖  ▗▄▖ ▗▖  ▗▖"
        text "▐▌ ▐▌▐▌ ▐▌▐▛▚▞▜▌"
        text "▐▛▀▚▖▐▛▀▜▌▐▌  ▐▌"
        text "▐▌ ▐▌▐▌ ▐▌▐▌  ▐▌${NC}"
        printf "\n"
        text "────────────────────── [ Info ] ───────────────────────"
        printf "\n"
        text "Enter the ${BGreen}RAM amount${NC} given to ${BYellow}your${NC} Server"
        text "You may ${Blue}use the given data to decide ${Green}better${NC}"
        text "If you ${BYellow}typed nothing${NC}, it will ${BRed}default${NC} to ${BGreen}Recommended${NC}"
        printf "\n"
        text "─────────────────────── [ RAM ] ───────────────────────"
        printf "\n"
        text "${BBlue}Total${NC} System RAM : ${total_gb}GB"
        text "${BYellow}Max${NC} Usage RAM    : ${max_ram}GB "
        text "${BGreen}Recommended${NC} RAM  : ${rec_gb}GB  "
        printf "\n"
        text "─── [ Decide Here ] ───────────────────────────────────"
        printf "\n"

        if [ -n "$error_msg" ]; then
            text "${BRed}[ERROR] $error_msg${NC}"
        else
            printf "\n"
        fi
        printf "\n"

        printf "%26s" "" && read -p "Recommended RAM? [y/n] : " pickram
		printf "\n\n"

        [ -z "$pickram" ] && pickram="y"

        if [[ "$pickram" =~ ^[Yy] ]]; then
            final_ram=$rec_gb
            break

        elif [[ "$pickram" =~ ^[Nn] ]]; then

            error_msg=""  # Resetting it will prevent the older Error Message to show up again

            while true; do		# 2nd Loop : Custom RAM
                clear
                printf "\n\n\n"
                text "ams 1.0"
                text "───────────────────────────────────────────────────────"
                text "▗▄▄▖  ▗▄▖ ▗▖  ▗▖"
                text "▐▌ ▐▌▐▌ ▐▌▐▛▚▞▜▌"
                text "▐▛▀▚▖▐▛▀▜▌▐▌  ▐▌"
                text "▐▌ ▐▌▐▌ ▐▌▐▌  ▐▌"
                printf "\n"
                text "────────────────────── [ Info ] ───────────────────────"
                printf "\n"
				text "Enter the ${BGreen}RAM amount${NC} given to ${BYellow}your${NC} Server"
				text "You may ${Blue}use the given data to decide ${Green}better${NC}"
				text "If you ${BYellow}typed nothing${NC}, it will ${BRed}default${NC} to ${BGreen}Recommended${NC}"
                printf "\n"
                text "─────────────────────── [ RAM ] ───────────────────────"
                printf "\n"
				text "${BBlue}Total${NC} System RAM : ${total_gb}GB"
				text "${BYellow}Max${NC} Usage RAM    : ${max_ram}GB "
				text "${BGreen}Recommended${NC} RAM  : ${rec_gb}GB  "
                printf "\n"
                text "─── [ Decide Here ] ───────────────────────────────────"
                printf "\n"

                if [ -n "$error_msg" ]; then
                    text "${BRed}[ERROR] $error_msg${NC}"
                else
                    printf "\n"
                fi
                printf "\n"

                printf "%26s" "" && read -p "Enter custom RAM in GB: " user_ram

                if ! [[ "$user_ram" =~ ^[0-9]+$ ]]; then
                    error_msg="Please enter a whole number."
                    continue
                elif [ "$user_ram" -gt "$max_ram" ]; then
                    error_msg="Exceeded limits. Max allowed is ${max_ram}GB."
                    continue
                elif [ "$user_ram" -lt 1 ]; then
                    error_msg="Minimum allocation is 1GB."
                    continue
                else
                    final_ram=$user_ram
                    break 2
                fi
            done
        else
            error_msg="Invalid option. Please type y or n."
            continue
        fi
    done
}


page5_confirm() {

	clear
	printf "\n\n\n"
	text "ams 1.0"
	text "───────────────────────────────────────────────────────"
	text "${BWhite}▗▄▄▖ ▗▄▄▄▖ ▗▄▖ ▗▄▄▄ ▗▖  ▗▖"
	text "▐▌ ▐▌▐▌   ▐▌ ▐▌▐▌  █ ▝▚▞▘ "
	text "▐▛▀▚▖▐▛▀▀▘▐▛▀▜▌▐▌  █  ▐▌  "
	text "▐▌ ▐▌▐▙▄▄▖▐▌ ▐▌▐▙▄▄▀  ▐▌  ${NC}"
	printf "\n"
	text "───────────────────── [ Summary ] ─────────────────────"
	printf "\n"
	printf "%30s" "" && echo -e "> ${BYellow}Server Loader${NC}     :  ${loader} "
	printf "%30s" "" && echo -e "> ${BGreen}Minecraft Version${NC} :  ${mc_version}"
	printf "%30s" "" && echo -e "> ${BBlue}Package Manager${NC}   :  ${pkgmgr}"
	printf "%30s" "" && echo -e "> ${BPurple}RAM Allocation${NC}    :  ${final_ram}GB"
	printf "\n"
	text "─── [ Decide Here ] ───────────────────────────────────"
	printf "\n"
	printf "%26s" "" && read -p "Proceed? [Y/n] : " pickconfirm

	[ -z "$pickconfirm" ] && pickconfirm="y"

		if [[ ! "$pickconfirm" =~ ^[Yy] ]]; then
			printf "\n"
			text "───────────────────── [ Terminated ] ──────────────────"
			printf "\n"
			text "${Red}Setup Terminated by User${NC}"
			printf "\n"
			exit 0

		else
			printf "\n"
			text "───────────────────── [ Sudo Access ] ──────────────────"                       # Sudo will usually last for 15mins, this script will finish in 3mins, so don't worry.
			printf "\n"
			text "${Yellow}Installing system dependencies requies root.${NC}"
			printf "\n"
			printf "%26s" "" && sudo -v || { echo -e "${BRed}[ERROR]${NC} Authentication failed. Exiting."; exit 1; }  # If sudo fails, it will ask again, or will exit entirely.
			printf "\n"
			text "Thanks for Using!"
		fi

}


# ──────── [ Engines ] ────────────
# Manifest/API -> Specifc Download Link via Jq -> cURL

vanilla() {

	local manifest_url="https://launchermeta.mojang.com/mc/game/version_manifest_v2.json"                                   # Updating the massive json file provided by Mojang
	local package_url=$(curl -s "$manifest_url" | jq -r --arg VER "$mc_version" '.versions[] | select(.id==$VER) | .url')   # Linking to given version

	if [ -z "$package_url" ]; then

		echo "${BRed}[ERROR]${NC} Minecraft version '${mc_version}' doesn't exist."
		exit 1

	fi

	local download_url=$(curl -s "$package_url" | jq -r '.downloads.server.url')               # Get the JAR file download link through "downloads > server > url"
	curl -s -L -o server.jar "$download_url"


}


fabric() {

	local latest_loader=$(curl -s "https://meta.fabricmc.net/v2/versions/loader" | jq -r '.[0].version')             # Taking the Latest Loader Available    -> .[0] = Latest Version
	local latest_installer=$(curl -s "https://meta.fabricmc.net/v2/versions/installer" | jq -r '.[0].version')       # Taking the Latest Installer Available -> .[0] = Latest Version

	local download_url="https://meta.fabricmc.net/v2/versions/loader/${mc_version}/${latest_loader}/${latest_installer}/server/jar"  # Link to that specifc file with said data

	curl -s -L -o server.jar "$download_url"


}


paper() {

	local user_agent="AbsoluteMinecraftStrap/1.0.0 (contact@ams.sh)"                                # Anonymous user can't access PaperMC's API, hence an User Identity
	local api_endpoint="https://fill.papermc.io/v3/projects/paper/versions/${mc_version}/builds"    # The PaperMC's API Endpoint that the script needs to access

	local response=$(curl -s -H "User-Agent: $user_agent" "$api_endpoint")

	if echo "$response" | jq -e '.ok == false' > /dev/null 2>&1 || [ -z "$response" ] || [ "$response" = "null" ]; then # Checking if the API is still supported

		echo -e "${BRed}[ERROR]${NC} Minecraft version '${mc_version}' has no supported stable assets on PaperMC."
		exit 1

	fi

	local download_url=$(echo "$response" | jq -r 'map(select(.channel == "STABLE")) | .[0].downloads."server:default".url') # Response gathers all the information, jq takes whats needed

	if [ "$download_url" = "null" ] || [ -z "$download_url" ]; then # If no stable build is found, the script will exit.

			echo -e "${BRed}[ERROR]${NC} No production-ready STABLE build found for Paper version ${mc_version}."
			exit 1

	fi

	curl -s -L -H "User-Agent: $user_agent" -o server.jar "$download_url"   # Accessing the API using our User Identity to download the JAR safely


}


# ──────── [ Process ] ────────────
# Main Glue of the Code

process() {

	clear
	printf "\n"
	echo -e "[${Green}+${NC}] Syncing tools and dependencies via $pkgmgr..."           # Updates & Installs java + jq from given package manager
		if [ "$pkgmgr" = "apt" ]; then
			sudo apt-get update -y > /dev/null 2>&1
			sudo apt-get install default-jdk jq -y > /dev/null 2>&1       # Ubuntu/Debian
		elif [ "$pkgmgr" = "pacman" ]; then
			sudo pacman -Syu jdk-openjdk jq --noconfirm > /dev/null 2>&1  # Arch Native
		elif [ "$pkgmgr" = "dnf" ]; then
			sudo dnf install java-latest-openjdk jq -y > /dev/null 2>&1   # Fedora
		elif [ "$pkgmgr" = "yay" ]; then
			yay -Syu jdk-openjdk jq --noconfirm > /dev/null 2>&1          # Arch AUR
		fi

	sleep 3

	echo -e "[${Green}+${NC}] Setting up Server's Directory at $HOME..."              # Creates in the common directory, the /home directory
	mkdir -p "$server"
	cd "$server" || exit   # If folder wasn't made, the script will exit.

	sleep 3

	echo -e "[${Green}+${NC}] Powering up the Engine for : $loader"                   # Installing the JAR file from given loader & their given APIs/Engines
	case $loader in
		"paper")   paper ;;
		"vanilla") vanilla ;;
		"fabric")  fabric ;;
	esac

	sleep 3

	echo -e "[${Green}+${NC}] Generating run.sh Script..."                            # Pre-configuration of the Server's Working + RAM Allocation + 1-click Access
	echo "eula=true" > eula.txt

	cat << EOF > run.sh
#!/bin/bash
# ──────────── [ ams ] ────────────
java -Xmx${final_ram}G -Xms${final_ram}G -jar server.jar
EOF

	sleep 3

	echo -e "[${Green}+${NC}] Making run.sh executable..."
	chmod +x run.sh        # Allows the file to be ran instantly, without needing the terminal

	echo -e "[${Green}+${NC}] Process Done!"
	sleep 2

}

# ──────────── [ End ] ────────────

end() {

	clear
	printf "\n\n\n"
	text "Absolute Minecraft Strap 1.0"
	text "───────────────────────────────────────────────────────"
	text "${BWhite} ▗▄▖ ▗▖  ▗▖ ▗▄▄▖"
	text "▐▌ ▐▌▐▛▚▞▜▌▐▌   "
	text "▐▛▀▜▌▐▌  ▐▌ ▝▀▚▖"
	text "▐▌ ▐▌▐▌  ▐▌▗▄▄▞▘${NC}"
	printf "\n"
	text "────────────────────── [ Done ] ───────────────────────"
	printf "\n"
	text "Your Minecraft Server is ${Green}completely ready!${NC}"
	text "Located at : ${Purple}${server}${NC}"
	printf "\n"
	text "───────────────────── [ Start ] ───────────────────────"
	printf "\n"
	printf "%30s" "" && echo -e ">  ${BYellow}cd $server${NC}"
	printf "%30s" "" && echo -e ">  ${BYellow}./run.sh${NC}"
	printf "\n"
	text "──────────────────── [ Please ] ───────────────────────"
	printf "\n"
	text "${Yellow}Star this script${NC} in GitHub if you find this cool!"
	text "Check out ${BWhite}@Glazzite${NC} on ${Green}GitHub/YT/X${NC}"
	text "${Blue}Thanks for Using this script! Enjoy! <3${NC}"
	printf "\n"
	text "─── [ Finish Here ] ───────────────────────────────────"
	printf "\n"
	printf "%26s" "" && read -p "Press Enter to finish... "
	printf "\n\n"
	exit 0

}

# ──────────────── [ Script ] ────────────────────────────

intro
page1_loader
page2_version
page3_pkg
page4_ram
page5_confirm
process
end

# ─────────────── [ Thanks ] ────────────────────────────
# Check out @Glazzite for More.
# Star this Repo if you liked it.
# And Thanks for Using! <3
# ───────────────────────────────────────────────────────


