#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

#
# PATH
#

#
# Alias
#

alias ll='ls -al'

alias ga='git add'
alias gc='git commit'
alias gl='git log'
alias glo='git log --oneline'
alias gd='git diff'
alias gs='git status'
alias gst='git stash'
alias gsl='git stash list'
alias gb='git branch'
alias gco='git checkout'
alias gm='git merge'
alias gps='git push'
alias gpl='git pull'

alias dp='docker ps'
alias du='docker-compose up -d'
alias dd='docker-compose down'

alias szr='source ~/.zshrc'

#
# peco
#

function peco-history-selection() {
  BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
  CURSOR=${#BUFFER}
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection