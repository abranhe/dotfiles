#!/usr/bin/env bash

#################################################### PERSONAL

export USERNAME=abranhe
export STACKOVERFLOW_ID=7602110        
export DEFAULT_SE=${DUCKDUCKGO}        # Default Search Engine
export DEFAULT_BROWSER='Google Chrome'
export MAIL=https://mail.abranhe.com
export EMAIL=abraham@abranhe.com

#################################################### WIFI variables
_W_DEVICE=${_W_DEVICE:-en0}

#################################################### LINKS

# Android Studio Config

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Registers
export NPM_URL=https://www.npmjs.com/
export PYPI_URL=https://pypi.org/
export DOCKER_URL=https://hub.docker.com/
export RUBY_URL=https://rubygems.org/
export MAVEN_URL=https://search.maven.org/

# Github
export GITHUB=https://github.com
export GITHUB_PROFILE=${GITHUB}/${USERNAME}
export GITHUB_GISTS=https://gist.github.com/${USERNAME}
export GITHUB_ISSUES=${GITHUB}/issues
export GITHUB_PR=${GITHUB}/pulls
export GITHUB_REPOS=${GITHUB}/${USERNAME}?tab=repositories
export GITHUB_STARS=${GITHUB}/${USERNAME}?tab=stars
export GITHUB_NOTIFICATIONS=${GITHUB}/notifications
export GITHUB_SETTINGS=${GITHUB}/settings/
export GITHUB_SEARCH=${GITHUB}/search?q=

# MDC
export MY_MATH_LAB=https://portal.mypearson.com/portal
export BLACKBOARD=http://mdc.blackboard.com
export MDC_CONNECT=http://www.mdc.edu/mdconnect/
export BIO_BEYOND=https://aelp.smartsparrow.com/c/ls/pyiqswqd
export SCHOOL_EMAIL=http://email.mymdc.net

# DEV
export STACKOVERFLOW=https://stackoveflow.com
export STACKOVERFLOW_PROFILE=${STACKOVERFLOW}/users/${STACKOVERFLOW_ID}
export STACKOVERFLOW_SEARCH=${STACKOVERFLOW}/search?q=

# Search
export GOOGLE=https://www.google.com/search?q=
export DUCKDUCKGO=https://duckduckgo.com/?q=
export BING=https://www.bing.com/search?q=
export YAHOO=https://search.yahoo.com/search?p=
export ASK=https://www.ask.com/web?q=
export INFO_COM=http://www.info.com/serp?q=

export TRANSLATE=https://translate.google.com/\#view=home\&op=translate\&sl=en\&tl=es\&text=
export YOUTUBE=https://www.youtube.com/results?search_query=
export PHUB=https://www.pornhub.com/video/search?search=
#################################################### COLORS
export GREEN='\033[0;32m'
export RED='\033[1;31m'

# Reset
export NC='\e[0m'                     # No Color

# Regular Colors
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_WHITE='\e[0;37m'

# Bold
export COLOR_B_BLACK='\e[1;30m'       # Black
export COLOR_B_RED='\e[1;31m'         # Red
export COLOR_B_GREEN='\e[1;32m'       # Green
export COLOR_B_YELLOW='\e[1;33m'      # Yellow
export COLOR_B_BLUE='\e[1;34m'        # Blue
export COLOR_B_PURPLE='\e[1;35m'      # Purple
export COLOR_B_CYAN='\e[1;36m'        # Cyan
export COLOR_B_WHITE='\e[1;37m'       # White

# Underline
export COLOR_U_BLACK='\e[4;30m'       # Black
export COLOR_U_RED='\e[4;31m'         # Red
export COLOR_U_GREEN='\e[4;32m'       # Green
export COLOR_U_YELLOW='\e[4;33m'      # Yellow
export COLOR_U_BLUE='\e[4;34m'        # Blue
export COLOR_U_PURPLE='\e[4;35m'      # Purple
export COLOR_U_CYAN='\e[4;36m'        # Cyan
export COLOR_U_WHITE='\e[4;37m'       # White

# Background
export COLOR_BG_BLACK='\e[40m'        # Black
export COLOR_BG_RED='\e[41m'          # Red
export COLOR_BG_GREEN='\e[42m'        # Green
export COLOR_BG_YELLOW='\e[43m'       # Yellow
export COLOR_BG_BLUE='\e[44m'         # Blue
export COLOR_BG_PURPLE='\e[45m'       # Purple
export COLOR_BG_CYAN='\e[46m'         # Cyan
export COLOR_BG_WHITE='\e[47m'        # White

# High Intensity
export COLOR_HI_BLACK='\e[0;90m'       # Black
export COLOR_HI_RED='\e[0;91m'         # Red
export COLOR_HI_GREEN='\e[0;92m'       # Green
export COLOR_HI_YELLOW='\e[0;93m'      # Yellow
export COLOR_HI_BLUE='\e[0;94m'        # Blue
export COLOR_HI_PURPLE='\e[0;95m'      # Purple
export COLOR_HI_CYAN='\e[0;96m'        # Cyan
export COLOR_HI_WHITE='\e[0;97m'       # White

# Bold High Intensity
export COLOR_BHI_BLACK='\e[1;90m'      # Black
export COLOR_BHI_RED='\e[1;91m'        # Red
export COLOR_BHI_GREEN='\e[1;92m'      # Green
export COLOR_BHI_YELLOW='\e[1;93m'     # Yellow
export COLOR_BHI_BLUE='\e[1;94m'       # Blue
export COLOR_BHI_PURPLE='\e[1;95m'     # Purple
export COLOR_BHI_CYAN='\e[1;96m'       # Cyan
export COLOR_BHI_WHITE='\e[1;97m'      # White

# High Intensity backgrounds
export COLOR_BG_HI_BLACK='\e[0;100m'   # Black
export COLOR_BG_HI_RED='\e[0;101m'     # Red
export COLOR_BG_HI_GREEN='\e[0;102m'   # Green
export COLOR_BG_HI_YELLOW='\e[0;103m'  # Yellow
export COLOR_BG_HI_BLUE='\e[0;104m'    # Blue
export COLOR_BG_HI_PURPLE='\e[10;95m'  # Purple
export COLOR_BG_HI_CYAN='\e[0;106m'    # Cyan
export COLOR_BG_HI_WHITE='\e[0;107m'   # White