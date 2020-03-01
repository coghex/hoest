set -x QEMU_AUDIO_DRV pa
set -x PULSE_LATENCY_MSEC 30
set -x QEMU_PA_SINK alsa_output.pci-0000_00_1f.3.analog-stereo.equalizer
set -x QEMU_PA_SOURCE input
set -x QEMU_PA_SERVER /run/user/1000/pulse/native
set -x QT_AUTO_SCREEN_SCALE_FACTOR 1
set -x GDK_SCALE 2
set -x ELM_SCALE 1.5
set -x BROWSER qutebrowser
set -x MAKEFLAGS -j4
set -x EDITOR nvim
set -gx PATH /home/hoest/.cabal/bin/ $PATH
set -gx TERM linux

alias c clear
alias fishconf "vim ~/.config/fish/config.fish"
alias diff "diff --color=always"
alias grep "grep --color=always"
alias fgrep "fgrep --color=auto"
alias egreo "egrep --color=auto"
alias less "less -R"
alias ls "ls --color=always"
alias diff "colordiff"
alias mount "mount |column -t"
alias vi vim
alias suvi "sudo vim"
alias update "sudo pacman -Syyu"
alias top atop
alias pacinstall "sudo pacman -S"
alias reload "source ~/.config/fish/config.fish"

function google
    qutebrowser https://www.google.com/search\?q=$argv
end
function yaourt
    cd ~/build
    git clone https://aur.archlinux.org/$argv
    cd $argv
    makepkg -si
end
function gityaourt
    cd ~/build
    git clone https://github.com/$argv[1]/$argv[2]
    cd $argv[2]
end
function wtf -d "Print which and --version output for the given command"
    for arg in $argv
        echo $arg: (which $arg)
        echo $arg: (sh -c "$arg --version")
    end
end

fish_user_key_bindings
fish_right_prompt
function fish_mode_prompt
end

function fish_title
    echo $argv[1]
end

function fish_greeting
    clear
    #if status is-login
    #    sudo echo "Welcome..."
    #    clear
    #end
    echo "***HOEST***" | toilet -f pagga | lolcat -p 20 -F 1
    fortune -sa | cowsay -T U -f (cowsay -l | string split " " | tail -n +5 | shuf -n 1)

    echo ""

    set --local ut (uptime | cut -d "," -f1 | cut -d "p" -f2 | sed 's/^ *//g')
    set --local myt (echo $ut | cut -d " " -f2)
    set --local fut $myt

    switch $myt
        case "days"
            set fut "$ut"
        case "min"
            set fut $ut"utes"
        case '*'
            set fut "$fut"
    end

    echo -en "Today is "
    set_color cyan
    echo -en (date +%m.%d.%Y)
    set_color normal
    echo -en ", I have been running for "
    set_color cyan
    echo -en "$fut"
    set_color normal
    echo "."

    set_color yellow
    echo -en "\tOS: "
    set_color 0F0
    echo -e (cat /etc/os-release | head -n 1 | cut -c 7- | rev | cut -c 2- | rev | tr '\n' ' '; uname -mr)
    set_color yellow
    echo -en "\tCPU: "
    set_color 0F0
    echo -en (lscpu | grep socket | cut -c 39-)
    echo -en "C"
    echo -en (lscpu | grep core | cut -c 39-)
    echo -en "T "
    #echo -en (sudo dmidecode --type processor | grep -i "version" | cut -c 28-)
    echo -en (lscpu | grep name | cut -c 39- | rev | cut -c 8- | rev)
    echo -e "scale=2; "(lscpu | grep max | cut -c 39-)/1000 | bc -l | tr -d '\n'
    echo -e "GHz"
    set_color yellow
    echo -en "\tRAM:"
    set_color 0F0
    echo -en (free -m | grep Mem | cut -c 31- | rev | cut -c 61- | rev)
    echo -en "GB "
    set_color yellow
    echo -en "SWAP: "
    set_color 0F0
    echo -en (free -m | grep Swap | cut -c 31- | rev | cut -c 25- | rev)
    echo -e "GB"
end

#this will run once at initial login
#if status is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx -- -keeptty
#    end
#    if not [ -z $SSH_TTY ]
#        #sudo /home/hoest/script/virshd
#    end
#    alias qutebrowser="qutebrowser \":later 1000 spawn --userscript /home/hoest/.local/share/qutebrowser/userscripts/reloadmin\""
#    #pulseaudio --start 2>/dev/null
#    amixer -qc 0 sset Headphone unmute
#    amixer -qc 0 sset Headphone 100%
#    amixer -qc 0 sset 'Auto-Mute Mode' Disabled 
#    #pulseaudio -k; pulseaudio --start 2>/dev/null
#end
