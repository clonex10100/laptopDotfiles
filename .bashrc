#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Enable bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
        . /usr/share/bash-completion/bash_completion


#DEFINE BASH COLORS
BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
RESET="\[$(tput sgr0)\]"

#Set prompt
export PS1="${BLUE}\u@\h${RESET} ${GREEN}\w${RESET}${RED}\$${RESET} "
export EDITOR=vim
export XDG_CONFIG_HOME=~/.config

#Basic aliases
alias q="exit"
alias c="clear"
alias ls='ls --color=auto'

#Alias for pacman installations/removal
alias pac="sudo pacman -Syu"
alias pacr="sudo pacman -Rs"
#Alias for searching in pacman and opening the file in vim
pacs (){
    pacman -Ss $1 > /tmp/pacs
    vim /tmp/pacs
}

#Editing aliases
alias v="vim"
alias e="sudo -e"

#Reload this file
alias r=". ~/.bashrc"

#Systemctl aliases
alias ena="sudo systemctl enable"
alias dis="sudo systemctl disable"
alias sta="systemctl status"

#Commonly edited config files
alias be="v ~/.bashrc"
alias ve="v ~/.vimrc"

#Random
alias scr="scrot ~/Pictures/screenshots/Y%-m%-d%-scrot.png"
alias exa="sudo chmod +x"

#Quick connections
alias m="mutt -f imaps://noah@nevans.me@mail.nevans.me"
alias mssh="sudo ssh -i /home/clone/.oldSSH/amazon/id_rsa admin@100.25.250.119"
alias rssh="ssh ubuntu@192.168.0.12"

#Project aliases
alias pmp="python3 ~/projects/mpdClient/src/mp.py"

#MPC macros
#plays an album
al(){
    mpc clear > /dev/null
    mpc search album $1 | mpc add
    mpc play
}
#plays a playlist
pl(){
    mpc clear > /dev/null
    cat ~/playlists/$1 | mpc add
    mpc play
}
#adds songs to playlist 
addToPlaylist(){
    if [ ! -f ~/playlists/$1 ]; then
        touch ~/playlists/$1
    fi
    mpc search title "$2" >> ~/playlists/$1
}

#view man page in vim
ma(){
    man $1 > /tmp/man
    vim /tmp/man
}

#alias for learn
te(){
    learn > /tmp/learnOut
    vim /tmp/learnOut
}

#upload file to oxo
oxo(){
    curl -F"file=@$1" http://0x0.st
}
#screenshot and upload
upScr(){
    scrot -o /tmp/scrot
    oxo /tmp/scrot
}




#Add qmk tools to path
export PATH="$PATH:$HOME/qmk_firmware/bin"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
#Loads rvm as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#Loads ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")" > /dev/null
fi
