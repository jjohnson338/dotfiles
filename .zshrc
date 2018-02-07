# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="babun"

plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

#Aliases
source ~/.shared_aliases

AGENT_PID=$(pgrep -x ssh-agent)
if [ $? -ne 0 ]; then
  echo "~/.zshrc: Starting SSH Agent!"

  eval `ssh-agent` && ssh-add ~/.ssh/id_rsa
  setx SSH_AUTH_SOCK $SSH_AUTH_SOCK
  setx SSH_AGENT_PID $SSH_AGENT_PID

  echo "~/.zshrc: SSH Agent running (PID: $SSH_AGENT_PID)"
else
  echo "~/.zshrc: SSH Agent already running (PID: $AGENT_PID)"
fi
