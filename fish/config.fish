set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx PATH ~/script ~/.local/bin ~/.ghcup/bin ~/.cabal/bin ~/build/bin /opt/ghc/bin /opt/cabal/bin /opt/glsl/bin $PATH
set -gx EDITOR nvim

alias c clear
alias fishconf "nvim ~/.config/fish/config.fish"
alias diff "diff --color=always"
alias grep "grep --color=always"
alias fgrep "fgrep --color=auto"
alias egrep "egrep --color=auto"
alias less "less -R"
alias ls "ls --color=always"
alias mount "mount |column -t"
alias vim nvim
alias suvi "sudo nvim"
alias aptinstall "sudo apt update; sudo apt install --install-suggests"
alias update "sudo apt update; sudo apt upgrade; sudo apt dist-upgrade; sudo apt autoremove"
alias reload "source ~/.config/fish/config.fish"
alias dfhack ~/game/df_linux/dfhack
alias protontricks-flat "flatpak run --command=protontricks com.valvesoftware.Steam"

for mode in default insert visual
  bind -M $mode \r -m default execute
end

function wtf -d "Print which and --version output for the given command"
    for arg in $argv
        echo $arg: (which $arg)
        echo $arg: (sh -c "$arg --version")
    end
end

fish_setup >> /dev/null
