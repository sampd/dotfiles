export ZSH_THEME_GIT_PROMPT_CACHE="false"
export GIT_PROMPT_EXECUTABLE="haskell"
source ~/dev/dotfiles/github/zsh-git-prompt/zshrc.sh

PROMPT='%B%m%~%b$(git_super_status) %# '

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  alias ls="ls --color=auto" 
elif [[ "$unamestr" == 'Darwin' ]]; then
  alias ls="ls -G"
fi
ps x -o command | grep "[s]sh-agent" > /dev/null 2>&1
PATH=$PATH:~/bin
set -o vi
HISTSIZE=30000
SAVEHIST=1000
HISTFILE=~/.zhistory
bindkey '^R' history-incremental-search-backward

if [ -d ~/.zshrc.d ]
then
  for f in ~/.zshrc.d/*; do
    . $f
  done
fi
