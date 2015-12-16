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
ZSH_CUSTOM="$HOME/.zsh/custom"
ZSH="$HOME/.oh-my-zsh"

COMPLETION_WAITING_DOTS=true

plugins=(git archlinux)

source "$ZSH/oh-my-zsh.sh"
