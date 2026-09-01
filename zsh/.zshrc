export PATH="/home/sam/.local/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/sam/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/sam/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=""

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Ctrl + Left / Right - move by word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Ctrl + Delete - delete next word
bindkey '^[[3;5~' kill-word

# Ctrl + Backspace - delete previous word
bindkey '^H' backward-kill-word

PROMPT='%n@%m:%~%# '

alias suspend='systemctl suspend'
alias hibernate='sudo systemctl hibernate'

alias clr='clear'
alias lock='gtklock'

alias ls='eza --group-directories-first'

alias gst='git status'

alias bcat='batcat'

alias wifilist='nmcli device wifi list'
alias wificonn='nmcli device wifi connect'
alias wifidel='nmcli connection delete'

mkcd() {
    mkdir -p "$1" && cd "$1"
}

dl() {
    local url
    url="$(wl-paste)"
    wget -O "$(basename "${url%%\?*}")" "$url"
}

autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

