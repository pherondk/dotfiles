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

# oh-my-zsh install
echo ''
echo "Now installing oh-my-zsh..."
echo ''
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


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

if [ -d "$HOME/.macrodirs" ]
then
		echo "Backing up existing directory."
		today=$(date +"%m_%d_%Y")
		cp -v $HOME/.macrosdir "$HOME/.macrosdir$today" && rm -rf $HOME/.macrosdir
		echo ''
		echo "Linking to dotfiles/.macrosdir"
		ln -v -s $HOME/dotfiles/.macrosdir
fi

if [ -d "$HOME/.mymacros.bash" ]
then
		echo "Backing up existing directory."
		today=$(date +"%m_%d_%Y")
		cp -v $HOME/.mymacros.bash "$HOME/.mymacros.bash$today" && rm -rf $HOME/.mymacros.bash
		echo ''
		echo "Linking to dotfiles/.mymacros.bash"
		ln -v -s $HOME/dotfiles/.mymacros.bash
fi


# Neovim install
echo ''
echo "Now install vim..."
echo ''
brew install vim

# oh-my-zsh plugin install
echo ''
echo "Now installing oh-my-zsh plugins..."
echo ''
# git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# powerlevel10k install
echo ''
echo "Now installing powerlevel10k..."
echo ''
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Speedtest-cli and jq install
# brew install jq speedtest-cli

# # App Installs
# echo ''
# echo "Now installing utilities"
# echo ''
# brew install bat ccze fzf googler rtv ripgrep reattach-to-user-namespace wget

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
