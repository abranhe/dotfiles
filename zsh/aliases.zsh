# General
alias cl="clear"
alias dot="cd ~/.dotfiles"
alias pro="cd ~/projects"
alias publickey="pbcopy < ~/.ssh/id_rsa.pub"
alias l="ls -l"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Text editor
alias st="subl ."
alias a="atom ."
alias vs="code ."

# Git aliases
alias gs="git status"
alias ga="git add -A"
alias wip="git add -A && git commit -m 'WIP'"
alias gl="git log --all --graph --decorate"

# Apache and MySQL aliases
alias apache.start="sudo apachectl start"
alias apache.stop="sudo apachectl stop"
alias apache.restart="sudo apachectl restart"
alias mysql.start="brew services start mysql"
alias mysql.stop="brew services stop mysql"
alias mysql.restart="brew services restart mysql"

# Npm aliases
alias ni="npm install"
alias nr="npm run"
alias ns="npm start"
alias nf="npm cache clean && rm -rf node_modules && npm install"

# yarn aliases
alias yi="yarn install"
alias ys="yarn start"
alias yr="yarn run"
alias yd="yarn run dev"
alias yb="yarn run build"

# Typos
alias npm unistall="npm uninstall"
alias brew unistall="brew uninstall"
alias eixt="exit"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Set default Python 3.7 and pip3 to path
alias python='/usr/local/bin/python3'
alias pip='/usr/local/bin/pip3'

# The Hub extension. Read more at https://hub.github.com/
alias git="hub"

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver3.opendns.com" # See https://go.abranhe.com/find-ip
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"

# vhosts
alias hosts='sudo vim /etc/hosts'

# copy working directory
alias cwd='pwd | tr -d "\r\n" | xclip -selection clipboard'

# copy file interactive
alias cp='cp -i'

# move file interactive
alias mv='mv -i'

# Shortcuts
alias downloads="cd ~/Downloads"
alias desktop="cd ~/Desktop"
alias h="history"
alias github="cd ~/github"
alias bitbucket="cd ~/bitbucket"
alias smarteat="cd ~/bitbucket/smarteat"
alias abranhe="cd ~/github/abranhe"
alias cdn="cd ~/github/abranhe/cdn"
alias tryhtml-cdn="cd ~/github/tryhtml/cdn"

# Docker
alias d='docker $*'
alias d-c='docker-compose $*'

# Git
alias gac='git add -A && git commit -m'
alias gc='git clone'

# Open simulator
alias simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# Kill all the tabs in Chrome to free up memory
# Read: https://go.abranhe.com/kill-chrome-tabs 
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine.
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Activity Monitor
alias activity='open /Applications/Utilities/Activity\ Monitor.app'

# Open Sketch 
# Check: https://github.com/AlexeySemigradsky/SketchRunner
alias sketch='/Applications/OPN\ Sketch.app/Contents/MacOS/applet'

# Open iMovie
alias imovie='open -a "iMovie"'

# Terminal Notifier
# Check Repo: https://github.com/julienXX/terminal-notifier
alias notify='terminal-notifier'

# Open .git
alias op='openup'

# Open package on npm
alias onpm='open-on-npm'

# Functions aliases
alias e='edit'
alias st='speedtest'
alias all-colors='print_all_colors'
alias or='open-repo'
alias ge='git-extras'
alias s='search'
alias open-repo='gh open'

# https://apple.stackexchange.com/a/15322/258558
alias copy="pbcopy"
