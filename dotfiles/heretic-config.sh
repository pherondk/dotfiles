#!/bin/bash
# 
# Gather files from dotfiles repo, install homebrew and then install specified software
# 
# Copied from https://github.com/jldeen/dotfiles and tweaked to my settings - 01312020-BMF

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Updating package lists..."
brew update

# zsh install
echo ''
echo "Now installing zsh..."
echo ''
brew install zsh zsh-completions

# Prep for docker
sudo groupadd docker
sudo gpasswd -a $USER docker

# Neovim install
echo ''
echo "Now install neovim..."
echo ''
brew install neovim

# Create directories for neovim config
echo ''
echo "Creating directories for Neovim..."
mkdir -p $HOME/.config/nvim/{autoload,bundle,colors,plugged}
echo ''
# echo "Linking .vimrc to init.vim"
# ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc
# source $HOME/.vimrc

# Installing git completion
# echo ''
# echo "Now installing git and bash-completion..."
# brew install git && brew install bash-completion
#
# echo ''
# echo "Now configuring git-completion..."
# GIT_VERSION=`git --version | awk '{print $3}'`
# URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash"
# echo ''
# echo "Downloading git-completion for git version: $GIT_VERSION..."
# if ! curl "$URL" --silent --output "$HOME/.git-completion.bash"; then
# 	echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
# fi

# oh-my-zsh install
echo ''
echo "Now installing oh-my-zsh..."
echo ''
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# oh-my-zsh plugin install
echo ''
echo "Now installing oh-my-zsh plugins..."
echo ''
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# powerlevel10k install
echo ''
echo "Now installing powerlevel10k..."
echo ''
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# link dotfiles in place
if [ -f "$HOME/.zshrc" ]
then
		echo "Backing up existing file"
		today=$(date +"%m_%d_%Y")
		cp -v $HOME/.zshrc "$HOME/.zshrc_$today" && rm -rf $HOME/.zshrc
		echo ''
		echo "Linking to dotfiles/.zshrc"
		ln -v -s $HOME/dotfiles/.zshrc
fi

if [ -f "$HOME/.zsh_aliases" ]
then
		echo "Backing up existing file"
		today=$(date +"%m_%d_%Y")
		cp -v $HOME/.zsh_aliases "$HOME/.zsh_aliases_$today" && rm -rf $HOME/.zsh_aliases
		echo ''
		echo "Linking to dotfiles/.zsh_aliases"
		ln -v -s $HOME/dotfiles/.zsh_aliases
fi

if [ -f "$HOME/.git_functions" ]
then
		echo "Backing up existing file"
		today=$(date +"%m_%d_%Y")
		cp -v $HOME/.git_functions "$HOME/.git_functions_$today" && rm -rf $HOME/.git_functions
		echo ''
		echo "Linking to dotfiles/.git_functions"
		ln -v -s $HOME/dotfiles/.git_functions
fi

# # Vim color scheme install
# echo ''
# echo "Now installing vim wombat color scheme..."
# echo ''
# git clone https://github.com/sheerun/vim-wombat-scheme.git ~/.config/nvim/colors/wombat 
# mv ~/.config/nvim/colors/wombat/colors/* ~/.config/nvim/colors/

# Speedtest-cli and jq install
# brew install jq speedtest-cli

# App Installs
echo ''
echo "Now installing utilities"
echo ''
brew install bat ccze fzf googler rtv ripgrep reattach-to-user-namespace wget

# Apps to install
#
# apps=(
# 		'appcleaner' 'microsoft-edge' 'middleclick' 'openemu'
# 		'powershell' 'sound-control' 'spotify' 'synergy' 'iterm2'
# 		'vmware-remote-console'	'the-unarchiver' '1password'
# 		'alfred' 'authy' 'bartender' 
# 		)
#
# for i in ${apps[@]}; do
# 		echo "Installing $i ..."
# 		brew search $i
# 		# brew cask install $i
# 		echo ''
# done
#

# Set default shell to zsh
echo ''
read -p "Do you want to change your default shell? y/n" -n 1 -r
echo ''
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Now setting default shell..."
    chsh -s $(which zsh); exit 0
    if [[ $? -eq 0 ]]
    then
        echo "Successfully set your default shell to zsh..."
    else
        echo "Default shell not set successfully..." >&2
fi
else 
    echo "You chose not to set your default shell to zsh. Exiting now..."
fi
