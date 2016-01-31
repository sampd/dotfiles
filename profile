#!/bin/zsh

set -o vi
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  alias ls="ls --color=auto" 
elif [[ "$unamestr" == 'Darwin' ]]; then
  alias ls="ls -G"
fi
ps x -o command | grep "[s]sh-agent" > /dev/null 2>&1
PATH=$PATH:~/bin
set -o vi
HISTSIZE=3000
SAVEHIST=1000
HISTFILE=~/.zhistory
bindkey '^R' history-incremental-search-backward

sk () {
   case $1 in
       save)
           if ssh-add -l > /dev/null 2>&1; then
               echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > $HOME/.ssh-auth-save
           fi
           ;;
       checksaved)
           ( . $HOME/.ssh-auth-save && ssh-add -l >/dev/null 2>&1 || exit 1 )
           ;;
       load)
           if ! ssh-add -l > /dev/null 2>&1; then
               . $HOME/.ssh-auth-save
           fi
   esac
}

if [ -d ~/.profile.d ]
then
  for f in ~/.profile.d/*; do
    . $f
  done
fi
