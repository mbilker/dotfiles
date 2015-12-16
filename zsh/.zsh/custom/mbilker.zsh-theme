# load some modules
autoload -U colors zsh/terminfo # Used in the colour alias below
colors
setopt prompt_subst

# make some aliases for the colours: (coud use normal escap.seq's too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
#eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_NO_COLOR="%{$reset_color%}"

# Check the UID
if [[ $UID -eq 0 ]]; then # root
  eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
  eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
  local PR_PROMPT='${PR_RED}> ${PR_NO_COLOR}'
else
  eval PR_USER='${PR_MAGENTA}%n${PR_NO_COLOR}'
  eval PR_USER_OP='${PR_MAGENTA}%#${PR_NO_COLOR}'
  local PR_PROMPT='$PR_NO_COLOR> $PR_NO_COLOR'
fi

local return_code="%(?..%{$PR_RED%} %?%{$PR_NO_COLOR%})"

eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}'
local user_host='${PR_USER}${PR_CYAN}@${PR_HOST}'
local current_dir='%{$PR_BLUE%}%~%{$PR_NO_COLOR%}'

function theme_mbilker_upgrade {
  curl https://mbilker.us/mbilker.zsh-theme > $HOME/.oh-my-zsh/custom/mbilker.zsh-theme
  echo "Updated"
}

local git_branch='$(git_prompt_info)%{$PR_NO_COLOR%}'

PROMPT="%{$PR_GREEN%}[${user_host} ${current_dir}${git_branch}${return_code}%{$PR_GREEN%}] $PR_PROMPT"
#RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$PR_YELLOW%}<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">%{$PR_NO_COLOR%}"

# LS colors, made with http://geoff.greer.fm/lscolors/
#export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LSCOLORS="Exfxcxdxbxegedabagacad"
#export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

alias ls='ls --color=tty'
