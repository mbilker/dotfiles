#
#                 ██     
#                ░██     
#  ██████  ██████░██     
# ░░░░██  ██░░░░ ░██████ 
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░ 
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ about  ▓ custom linux config files
# ░▓ author ▓ mbilker <me@mbilker.us>
# ░▓ code   ▓ https://github.com/mbilker/dotfiles
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
#█▓▒░ oh-my-zsh initialization 
ZSHC="$(dirname "${BASH_SOURCE:-$0}")"
ZSH_CUSTOM="$ZSHC/custom"

COMPLETION_WAITING_DOTS=true

plugins=(git archlinux)

source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
