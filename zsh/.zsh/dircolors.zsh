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
#  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░▓ about           ▓ custom linux config files
# ░▓ author          ▓ mbilker <me@mbilker.us>
# ░▓ original author ▓ xero <x@xero.nu>
# ░▓ code            ▓ https://github.com/mbilker/dotfiles
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░
#
#█▓▒░ dircolors import
if [[ "$(uname -s)" == "FreeBSD" ]]; then
  eval `gdircolors ~/.dircolors`
else
  eval `dircolors ~/.dircolors`
fi
