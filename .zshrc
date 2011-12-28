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

alias ls='ls -G'
alias ll='ls -l'
alias ql='qlmanage -p "$@" >& /dev/null'
alias imgsize="mdls -name kMDItemPixelWidth -name kMDItemPixelHeight"

export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

export EDITOR=vim
export LANG=ja_JP.UTF-8
export TZ='Asia/Tokyo'

function chpwd() { pwd; ls }
