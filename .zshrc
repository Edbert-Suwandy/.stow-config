ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if don't exsist
if [ ! -d "$ZINIT_HOME" ];then
  mkkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add powerlevel 10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add zsh-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add zsh-completions
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

# Add zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions
bindkey '^f' autosuggest-accept

# Add fzf-tab
zinit light "Aloxaf/fzf-tab"


eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

ZSH_THEME="robbyrussell"

# History
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

# Completion and mathcing
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:&' menu no

# Aliases
alias nf="nvim $(fzf)"
alias ls="ls --color"
alias k="kubectl"
alias vim="nvim"
alias tf="terraform"