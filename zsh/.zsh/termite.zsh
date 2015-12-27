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
#█▓▒░ import vte profile file for termite
if [[ "$OSTYPE" = "linux"* ]]; then
  source /etc/profile.d/vte.sh
fi
