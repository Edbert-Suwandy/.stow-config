echo "checking shell ==>"
if [ $SHELL != "/bin/zsh" ]; then
  echo install zsh first
  exit
fi
echo "zsh shell is in used"

echo "installing zinit"


echo "installing homebrew ==>"
# install gcc if on lunix-gnu
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "installing homebrew packages ==>"
brew list zoxide || brew install zoxide
brew list fzf || brew install fzf 
brew list neovim || brew install neovim

echo "Setup Finished"
