###############
# Sean .bashrc
###############


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Bell
bind 'set bell-style visible'


# History
shopt -s histappend
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
# Save history after each command
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


# Update window size after each command
shopt -s checkwinsize


# Editor
export EDITOR=vim
export VISUAL=vim


# Color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Convenient color codes
CLEAR=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
YELLOW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
MAGENTA=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')
LIGHTGRAY=$(echo -en '\033[00;37m')
BRED=$(echo -en '\033[01;31m')
BGREEN=$(echo -en '\033[01;32m')
BYELLOW=$(echo -en '\033[01;33m')
BBLUE=$(echo -en '\033[01;34m')
BMAGENTA=$(echo -en '\033[01;35m')
BCYAN=$(echo -en '\033[01;36m')
WHITE=$(echo -en '\033[01;37m')
BGRED=$(echo -en '\033[01;41m')


# Prompt
function virtualenv_indicator() {
    if [[ -n "$VIRTUAL_ENV"  ]] ; then
        echo " 🐍"
    else
        echo ""
    fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

PS1='\n${CYAN}[\t]${CLEAR} ${GREEN}\u@${BGREEN}\h${CLEAR}:${BBLUE}\w${CLEAR}$(virtualenv_indicator) $(__git_ps1 "${MAGENTA}[%s]${CLEAR}")  \n\$ '


# Enable vi mode
set -o vi
bind 'set show-mode-in-prompt on'
bind "set vi-ins-mode-string \1${LIGHTGRAY}\2(ins)\1${CLEAR}\2 \1\e[1 q\2"
bind "set vi-cmd-mode-string \1${BGRED}\2(cmd)\1${CLEAR}\2 \1\e[1 q\2"


# Don't show directories with green background, it's gross
LS_COLORS+=':ow=01;34'


# Dotfiles setup
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
