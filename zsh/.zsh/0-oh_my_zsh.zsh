ZSHC="$(dirname "${BASH_SOURCE:-$0}")"
ZSH_CUSTOM="$ZSHC/custom"

COMPLETION_WAITING_DOTS=true

plugins=(git archlinux)

source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
