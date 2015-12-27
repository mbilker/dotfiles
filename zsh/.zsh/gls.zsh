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
#█▓▒░ prefer gls on freebsd
if [[ "$(uname -s)" == "FreeBSD" ]]; then
  gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
fi
