echo "installing packages with homebrew ==>"

brew list zsh || brew install zsh
brew list zoxide || brew install zoxide
brew list fzf || brew install fzf 
brew list neovim || brew install neovim
brew list stow || brew install stow
brew list powerlevel10k || brew install powerlevel10k
brew list ripgrep || brew install ripgrep

echo "setting up zsh as main shell"
sudo chsh -s $(which zsh)

echo "setting up stow config"
cdir="$(pwd)"

cd ~/.stow-config
stow .
cd $CDIR

echo "Setup Finished"

