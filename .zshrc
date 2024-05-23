# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZINIT ================================================================================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download zinit if don't exsist
echo "setting up zinit"
if [ ! -d "$ZINIT_HOME" ];then
  echo "installing zinit"
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

echo "installing zinit plugins"
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
# zinit light "Aloxaf/fzf-tab"

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

# Setup homebrew ======================================================================================================
echo "checking for homebrew ==>"
if [ ! -d "$HOMEBREW_PREFIX" ];then
  echo "installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi



echo "setting up dependency of homebrew ==>"

# Aliases
# alias nf="nvim $(fzf)"
alias ls="ls --color"
alias k="kubectl"
alias vim="nvim"
alias tf="terraform"

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# homebrew setup
if [[ $OSTYPE == *"darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ $OSTYE == *"linux-gnu"* ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "finished setup"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
