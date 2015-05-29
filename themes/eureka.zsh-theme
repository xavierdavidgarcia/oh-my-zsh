# eureka.zsh-theme

# load some modules
autoload -U zsh/terminfo # Used in the colour alias below
setopt prompt_subst

# Check if we are on SSH or not
function where_im {
	if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
	  echo "%{$FG[021]%}☁ "
	else
	  echo "%{$FG[069]%} "
	fi
}


if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX='⚡'
fi



function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "➜" && return
  echo '○'
}

function eureka_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $SHORT_HOST || echo $HOST
}

function mydate_info {
    MY_DATE=$(date +%d/%m-%H:%M:%S)
    echo ${MY_DATE}
}




local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'


PROMPT="[%{$FG[004]%}%n%{$reset_color%}%{$reset_color%}@%{$reset_color%}%{$FG[073]%}$(eureka_name)%{$reset_color%}:%{$reset_color%}%{$terminfo[bold]$FG[227]%}${current_dir}%{$reset_color%}]${git_info}%{$FG[239]%}
$(prompt_char) %{$reset_color%}$(mydate_info) %{$reset_color%} $(where_im)"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}%{$reset_color%}%{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[196]%} ✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[160]%} ✔"


