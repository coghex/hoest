set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx PATH ~/script ~/.cabal/bin /opt/ghc/bin /opt/cabal/bin /opt/glsl/bin $PATH

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
alias aptinstall "sudo apt install"
alias reload "source ~/.config/fish/config.fish"

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
