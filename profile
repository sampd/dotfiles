set -o vi
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  alias ls="ls --color=auto" 
elif [[ "$unamestr" == 'Darwin' ]]; then
  alias ls="ls -G"
fi
ps x -o command | grep [s]sh-agent >/dev/null 2>&1
PATH=$PATH:~/bin
set -o vi
HISTFILE=~/.history
HISTSIZE=10000

PS1="[${HOSTNAME}:\${PWD##*/} \$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')]\$ "
export PS1

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
  source ~/.profile.d/*
fi
