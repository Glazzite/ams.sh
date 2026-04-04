<h1 align="center">

**Automated Minecraft Server**

<img src="images/ams.png" alt="Automated Minecraft Server" width="600">

</h1>

<div align="center">

*"The fastest way to bootstrap a Minecraft server on Linux."*

![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/glazzite/ams.sh/total?style=for-the-badge&color=lightblue)
![GitHub Repo stars](https://img.shields.io/github/stars/glazzite/ams.sh?style=for-the-badge&color=gold)
![GitHub Tag](https://img.shields.io/github/v/tag/glazzite/ams.sh?include_prereleases&sort=semver&style=for-the-badge&label=Version&color=Lightgreen)

</div>

<div align="center">

ams.sh is a lightweight, deployment, bootstrap script designed to spin up a production-ready, Java Minecraft server in under 10 minutes. By condensing environment configuration, dependency management, and EULA automation into a single execution, it eliminates the friction of manual setup, delivering a clean, unbloated instance every time. 

</div>


# 📘 Installation

There are 3 methods to download the script, all needing a bash commandline/terminal.

### 1. cURL (simplest)
```
curl -sSL https://github.com/Glazzite/ams.sh/releases/download/v0.1/ams.sh | bash
```

### 2. Releases
Latest versions of the script will be downloadable in the Release tab of this repo. Once downloaded,
```
cd /{saved-directory}/
chmod -x ams.sh
sudo ams.sh
``` 

### 3. Repo Cloning
``` 
git clone https://github.com/Glazzite/ams.sh
cd ams.sh
chmod -x ams.sh
sudo ams.sh
```

And the script will guide you and do its thing automatically.

# 📕 Information

### ❓ How?
In its core lines, its just,
- Installing Java
- Downloading Server.jar from MC
- Make a Working Directory
- Start Server
- Edit Eula.txt

With extra decorations and supportive commands, and thats the scirpt. 

> [!NOTE]
> This script is fully online-based, so make sure to stay connected to the internet before use. 😊

### ❓ Why?
To use a repurposable script ->
- To automate any MC server setup
- For people who often makes new serers
- For beginners who don't know how to make one

> [!CAUTION]
> This script was made as a learning experience for me, the creator.

### 💻 Operating System
This script is made for Linux (GNU/Linux), specifcally,
- [x] Ubuntu/Debain (apt)
- [ ] Arch Linux (pacman/yay)

As this scirpt installs packages via the native package manager of said distros.

### ⛏ Minecraft Version
Currently supported MC versions are
- [x] 26.1.1

> [!IMPORTANT]
> More MC versions will be supported soon.

# 🧪 To-Do List

> [!NOTE]
> If you'd like to contribute this repository, please be our guest.

Start
- [x] Make Basic Script

Minecraft Related
- [ ] Forge/Fabirc/Paper Setup
- [ ] Automated Optimizations

QoL Features
- [ ] User-Friendly Guided Install
- [ ] Multi-MC Version Capability
- [ ] Error-Handling
- [ ] Cleaner Decoratives
- [ ] Package Manager Detector

OS Capability
- [ ] Arch Linux
- [ ] SteamOS
- [ ] Linux Distros

> [!IMPORTANT]
> The script will be 100% Bash/Shell written and will not use any external languages.


# 🔔 Credits
Code written by Glazzite.
License under GNU 3.0 General Public License.

> [!IMPORTANT]
> A bit of AI was used for the first part of the code - "Scirpt Dir"

# 🍵 Buy me some tea?
Donating isn't necessary, just a reminder.

> i hate caffeine.

# 🙏 Thank you!
Have fun with the script!





