#Good to have
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color --time-style=long-iso"
  alias la='gls -A --color'
  alias lla='gls -lA --color --time-style=long-iso'
fi
alias ls='gls --color --time-style=long-iso'
alias ll='gls -l --color --time-style=long-iso'
alias gss='git status -s'
alias glog="git log --oneline --decorate --color --graph"
alias vdf="vagrant destroy --force"
alias vu="vagrant up"

