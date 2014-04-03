# .bashrc

# HEY DO THIS
#   ... add this to your .bash_profile
# if [ -f ~/.bashrc ]; then
   # source ~/.bashrc
# fi

#aliases
alias la='ls -la'
alias ls='ls -Gp'
alias ..='cd ..'
alias ll='ls -laGp'
alias :q='exit'

#svn
alias svndiff='svn diff --diff-cmd ~/bin/svndiff_helper $*' 
export EDITOR="vim"
#git
source ~/.git-completion.sh
__git_complete gc _git_checkout
alias gb='git branch -v'
alias gs='git status'
alias gd='git diff'

# gc      => git checkout master
# gc bugs => git checkout bugs
function gc {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

function gcob {
  if [ "$1" ]; then
    git checkout -b $1 master
  fi
}
function gmm {
  git merge master
}

alias gitdiff='git diff --color-words' 

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    COLORS=/etc/DIR_COLORS
    [ -e "/etc/DIR_COLORS.$TERM" ] && COLORS="/etc/DIR_COLORS.$TERM"
    [ -e "$HOME/.dircolors" ] && COLORS="$HOME/.dircolors"
    [ -e "$HOME/.dircolors.$TERM" ] && COLORS="$HOME/.dircolors.$TERM"
    [ -e "$HOME/.dir_colors" ] && COLORS="$HOME/.dir_colors"
    [ -e "$HOME/.dir_colors.$TERM" ] && COLORS="$HOME/.dir_colors.$TERM"
    [ -e $COLORS ] && eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

#fancy prompt
green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
red=$(tput setaf 1)
reset=$(tput sgr0)
PS1='\u@\[$green\]\h\[$reset\]:\w\[$blue\]$(__git_ps1)\[$reset\] \$ '

alias tmux="tmux -2"

