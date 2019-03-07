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
#█▓▒░ timestamps
#HIST_STAMPS=mm/dd/yyyy

#█▓▒░ paths
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
export PATH="$HOME/bin:$HOME/.gopath/bin:$HOME/.local/bin:$PATH"
#export MANPATH="/usr/local/man:$MANPATH"
export GOPATH="$HOME/.gopath"

#█▓▒░ Rust
export PATH="$HOME/.cargo/bin:$PATH"

#█▓▒░ Firefox
export MOZ_USE_XINPUT2=1

#█▓▒░ Android Studio
# Use platform-tools versions over system-wide versions
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"

#█▓▒░ mac specific paths
if [[ "$(uname -s)" == "Darwin" ]]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/ruby/bin:/usr/local/share/npm/bin:/usr/local/opt/go/libexec/bin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

#█▓▒░ set term variable explictly on freebsd
if [[ "$(uname -s)" == "FreeBSD" ]] && [[ "${TERM}" == "xterm-termite" ]]; then
  export TERM="xterm-256color"
fi

#█▓▒░ preferred editor for local and remote sessions
export EDITOR=vim
export VISUAL=vim

#█▓▒░ language
LANG=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=en_US.UTF-8
