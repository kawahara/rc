export PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

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

alias ls='ls -G --color'
alias ll='ls -l'
alias ql='qlmanage -p "$@" >& /dev/null'
alias imgsize="mdls -name kMDItemPixelWidth -name kMDItemPixelHeight"

export EDITOR=vim
export LANG=ja_JP.UTF-8
export TZ='Asia/Tokyo'

function chpwd() { pwd; ls }

# http://d.hatena.ne.jp/zenpou/20080117/1200539192
function preexec () {
    if [ $TERM = "screen" ]; then
        1="$1 "
        cname=`echo $1 | cut -f1 -d ' '`
        lang=`echo $LANG | sed "s/.\+\.\(.\).\+/\1/"`
        echo -ne "\ek$cname($lang)\e\\"
    fi
}
