# Use colored prompt
autoload -U colors && colors

# prompt substitution
setopt prompt_subst

# vcs_info (git only - for now)
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%{$fg_bold[green]%}+%{$reset_color%}"
zstyle ':vcs_info:*' unstagedstr "%{$fg_bold[red]%}!%{$reset_color%}"

function precmd() {
  # find untracked files - from inside the repo root
  if [[ -z $(cd $(git rev-parse --show-toplevel 2> /dev/null) && git ls-files --others --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats "(%{$fg_bold[magenta]%}%b%{$reset_color%}%c%u) "
  } else {
    zstyle ':vcs_info:*' formats "(%{$fg_bold[magenta]%}%b%{$reset_color%}%c%u%{$fg_bold[red]%}?%{$reset_color%}) "
  }

  vcs_info
}

# set prompt
PROMPT="%{$fg_bold[green]%}%n%{$reset_color%} " # Name
PROMPT+="%{$fg_bold[blue]%}%~%{$reset_color%} " # Current Directory
PROMPT+='${vcs_info_msg_0_}'                    # vcs - single quotes important
PROMPT+="%(1j.%{$fg_bold[red]%}.%{$fg_no_bold[white]%})"
PROMPT+="λ%{$reset_color%} "

# Auto completion
autoload -U compinit
compinit

# Unbreak broken, non-colored terminal
export TERM='xterm-256color'
export GREP_OPTIONS="--color"

# color output for less
export LESS='-R'

# Setup ls colors
if [ -f ~/.dir_colors ]; then
  eval $(dircolors -b ~/.dir_colors)
else
  eval $(dircolors -b)
fi

# history
export HISTSIZE=100000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

# PATH
export PATH=/sbin:/bin
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:$PATH
export PATH=$PATH:/usr/games
export PATH=$HOME/bin:$HOME/local/bin:$PATH
export PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH


# Load common aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
