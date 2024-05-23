$!/bin/bash


echo "checking shell ==>"
if [ $SHELL != "/bin/zsh" && $SHELL != "/usr/bin/zsh"  ]; then
  echo install zsh first
  exit
fi
echo "zsh shell is in used"

echo "installing homebrew ==>"
# install gcc if on lunix-gnu
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/edbert/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
mv ~/.zshrc ~/.zshrc.bak
source ~/.stow-config/.zshrc

echo "installing homebrew packages ==>"
brew list stow || brew install stow
brew list zoxide || brew install zoxide
brew list fzf || brew install fzf 
brew list neovim || brew install neovim

echo "setting up stow"
CDIR= $(PWD)
cd ~/.stow-config
stow .
cd $CDIR

echo "setup finished"
