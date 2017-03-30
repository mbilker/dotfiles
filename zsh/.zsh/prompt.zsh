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
# ░▓ author          ▓ mbilker <me@mbilker.us>
# ░▓ original author ▓ xero <x@xero.nu>
# ░▓ code            ▓ https://github.com/mbilker/dotfiles
# ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░░░░░░░░░░

#ICO_DIRTY="⚡"
#ICO_DIRTY="↯"
ICO_DIRTY="*"
#ICO_AHEAD="↑"
ICO_AHEAD="🠙"
#ICO_AHEAD="▲"
#ICO_BEHIND="↓"
ICO_BEHIND="🠛"
#ICO_BEHIND="▼"
ICO_DIVERGED="⥮"
COLOR_ROOT="%F{red}"
COLOR_USER="%F{cyan}"
COLOR_NORMAL="%F{white}"
PROMPT_STYLE="classic"


#█▓▒░ allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

#█▓▒░ colors for permissions
if [[ "$EUID" -ne "0" ]]
then  # if user is not root
	USER_LEVEL="${COLOR_USER}"
else # root!
	USER_LEVEL="${COLOR_ROOT}"
fi

#█▓▒░ git prompt
setopt promptsubst
autoload -Uz vcs_info
GIT_PROMPT() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      # prompt_segment yellow black
      color=%F{yellow}
    else
      # prompt_segment green black
      color=%F{green}
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '+'
    zstyle ':vcs_info:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info

    case "$PROMPT_STYLE" in
      ninja)
        echo "${COLOR_NORMAL}${color}${ref/refs\/heads\//}${mode}${vcs_info_msg_0_%% }"
      ;;
      ascii)
        echo "%{$bg[magenta]%}%F{cyan}▓▒░ ${color}${ref/refs\/heads\//}${mode}${vcs_info_msg_0_%% } $reset_color%F{magenta}▒░"
      ;;
      arrows)
        echo "%{$bg[magenta]%}%F{cyan} ${color}${ref/refs\/heads\//}${mode}${vcs_info_msg_0_%% } $reset_color%F{magenta}"
      ;;
      *)
        echo "${USER_LEVEL}─[${color}${ref/refs\/heads\//}${mode}${vcs_info_msg_0_%% }${USER_LEVEL}]"
      ;;
    esac
  fi
}

case "$PROMPT_STYLE" in
#█▓▒░ ascii
ascii)
PROMPT='%{$bg[cyan]%} %F{black}%~ $(GIT_PROMPT)$reset_color %f'
;;
#█▓▒░ arrows
arrows)
PROMPT='%{$bg[cyan]%}%F{black} %~ $(GIT_PROMPT)$reset_color %f'
;;
#█▓▒░ ninja
ninja)
PROMPT='%F{white}
        ▟▙  ${USER_LEVEL}%~   %F{white}$(GIT_PROMPT) %F{white}
▟▒${USER_LEVEL}░░░░░░░%F{white}▜▙▜████████████████████████████████▛
▜▒${USER_LEVEL}░░░░░░░%F{white}▟▛▟▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▛
        ▜▛  
            %f'
;;
#█▓▒░ dual line
dual)
PROMPT='${USER_LEVEL}┌[${COLOR_NORMAL}%~${USER_LEVEL}]$(GIT_PROMPT)
${USER_LEVEL}└─ - %f'
;;
#█▓▒░ classic
*)
PROMPT='${USER_LEVEL}[${COLOR_NORMAL}%~${USER_LEVEL}]$(GIT_PROMPT)── - %f'
;;
esac
