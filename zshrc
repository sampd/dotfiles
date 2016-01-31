export ZSH_THEME_GIT_PROMPT_CACHE="true"
export GIT_PROMPT_EXECUTABLE="haskell"
source ~/dev/dotfiles/github/zsh-git-prompt/zshrc.sh

PROMPT='%B%m%~%b$(git_super_status) %# '
