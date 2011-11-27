HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# prompt
autoload colors
colors
PROMPT="%{$fg_bold[green]%}[%n@%m %1~]%(!.#.$)%{$reset_color%} "
#RPROMPT=""

setopt auto_pushd # cd -[tab]
setopt pushd_ignore_dups
setopt correct

alias ll='ls -l'
alias ql='qlmanage -p "$@" >& /dev/null'
alias imgsize="mdls -name kMDItemPixelWidth -name kMDItemPixelHeight"

export EDITOR=vim
export LANG=ja_JP.UTF-8
export TZ='Asia/Tokyo'

function chpwd() { pwd; ls }
