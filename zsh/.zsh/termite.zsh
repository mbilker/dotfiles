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
#█▓▒░ import vte profile file for termite, but not under gentoo
if [[ "$OSTYPE" = "linux"* ]] && [ ! -f /etc/gentoo-release ]; then
  source /etc/profile.d/vte.sh
fi
