eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"

# Zap ================================================================================================================
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

autoload -Uz compinit
compinit

# Zioxide =============================================================================================================
eval "$(zoxide init zsh)"

# Themes and fonts ====================================================================================================

ZSH_THEME="robbyrussell"

# History =============================================================================================================
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion and matching ==============================================================================================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

#kubeneretes completions
source <(helm completion zsh)
source <(kubectl completion zsh)
# Aliases
alias ls="ls --color"
alias k="kubectl"
alias vim="nvim"
alias tf="terraform"
alias cd="z"

# Kubernetes stuff
alias kns="kubens"
alias kctx="kubectx"

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi


# Load Angular CLI autocompletion.
source <(ng completion script)
