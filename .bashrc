#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias update='sudo pacman -Syu'
alias top='pacman -Qen'
alias topaur='pacman -Qm'
alias clean='sudo pacman -Qtdq | sudo pacman -Rns -'
alias makeaur='makepkg -s -i -c'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"'
alias config='/usr/bin/git --git-dir=/home/stanley/.cfg/ --work-tree=/home/stanley'
alias pacman='sudo pacman'

PS1='[\u@\h \W]\$ '

export EDITOR=vim
export VISUAL=vim

function updateaur() {
    cd ~/AUR
    ls | xargs -I{} git -C {} pull
    cd ~
}

function aur() {
    cd ~/AUR
    git clone https://aur.archlinux.org/"$1".git
    if [ $2 == i ]; then
        cd $1
        makeaur
    fi
    cd ~
}

function open() {
    if [ $1 == notion ]; then
        screen -dmS notion notion-app-enhanced
    fi
    screen -dmS $1 $1
}

function play() {
    left="$HOME/.steam/steam/steamapps/common"
    right=""
    exe=""

    case "$1" in
        "df") screen -dmS dwarf_fortress dwarffortress
        return;;

        "FTL" | "ftl" ) right="FTL\\ Faster\\ Than\\ Light"
        exe=FTL
        ;;

        *) echo "unknown game"
        return;;
    esac

    path="$left"/"$right"
    screen -dmS "$exe" sh
    screen -S "$exe" -X stuff "cd $path
    "

    screen -S "$exe" -X stuff "./$exe
    "

    screen -S "$exe" -X stuff "exit
    "
}

neofetch
