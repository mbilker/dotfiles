#                 ██      
#                ░██      
#  ██████  ██████░██      
# ░░░░██  ██░░░░ ░██████  
#    ██  ░░█████ ░██░░░██ 
#   ██    ░░░░░██░██  ░██ 
#  ██████ ██████ ░██  ░██ 
# ░░░░░░ ░░░░░░  ░░   ░░  
#
#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓ about           ▓ custom linux config files
# ░▓ author          ▓ mbilker <me@mbilker.us>
# ░▓ original author ▓ xero <x@xero.nu>
# ░▓ code            ▓ https://github.com/mbilker/dotfiles
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░
#
#█▓▒░ ssh keys
export SSH_KEY_PATH="~/.ssh/id_ed25519"

#█▓▒░ x11 ssh askpass
if [ -f "/usr/lib/ssh/x11-ssh-askpass" ]; then 
  export SSH_ASKPASS="/usr/lib/ssh/x11-ssh-askpass"
fi

#█▓▒░ funtoo keychain
if [[ "$EUID" -ne "0" ]] && [[ "$(uname -s)" != "Darwin" ]]; then
  eval `keychain --eval ~/.ssh/id_ed25519`
fi
