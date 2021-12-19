#
# ~/.bashrc
#

include () {
    [[ -f "$1" ]] && source "$1"
}

# Change the window title of X terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
    ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
  && type -P dircolors >/dev/null \
  && match_lhs=$(dircolors --print-database)
  [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if type -P dircolors >/dev/null ; then
    if [[ -f ~/.dir_colors ]] ; then
        eval $(dircolors -b ~/.dir_colors)
    elif [[ -f /etc/DIR_COLORS ]] ; then
        eval $(dircolors -b /etc/DIR_COLORS)
    fi
fi

alias ls='lsd'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

export TERMINAL=/usr/bin/alacritty

export BROWSER=/usr/bin/firefox

case $(uname | tr '[:upper:]' '[:lower:]') in
  linux*)
    OS_NAME=linux
    ;;
  darwin*)
    OS_NAME=osx
    ;;
  msys*)
    ;&
  ming*)
    OS_NAME=windows
    ;;
  *)
    OS_NAME=notset
    ;;
esac

export EDITOR=nvim
if [ ! $OS_NAME = "windows" ]; then
  # ssh-agent configuration
  if [ -z "$(pgrep ssh-agent)" ]; then
    rm -rf /tmp/ssh-*
    eval $(ssh-agent -s) > /dev/null
  else
    export SSH_AGENT_PID=$(pgrep ssh-agent)
    export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
  fi


  #optional... potentially annoying
  if [ "$(ssh-add -l)" == "The agent has no identities." ]; then
    ssh-add 2>/dev/null
  fi
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]> "

# WSL2
if grep -q "microsoft" /proc/version &>/dev/null; then
    # Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
    export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3 }'):0"
fi

#Aliases
include ~/.shared_aliases
include ~/.bashrc.extend

include ~/.config/fzf/key-bindings.bash
include ~/.config/fzf/completion.bash

# Don't ignore gitignore files, include hidden, search from home
export FZF_CTRL_T_COMMAND="fd -I -H . $HOME"
# Only include dirs, don't ignore gitignore files, include hidden, search from home
export FZF_ALT_C_COMMAND="fd -t d -I -H . $HOME"
