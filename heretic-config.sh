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

# Neovim install
echo ''
echo "Now install neovim..."
echo ''
brew install neovim

# Create directories for neovim config
echo ''
echo "Creating directories for Neovim..."
mkdir -p $HOME/.config/nvim/{autoload,bundle,colors,plugged}
# Get .vimrc/init.vim
echo ''
echo "Now retrieving .VIMRC..."
curl https://raw.githubusercontent.com/pherondk/dotfiles/master/.vimrc > $HOME/.config/nvim/init.vim
ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc
source $HOME/.vimrc

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

# Get .zshrc from my dotfiles repo
echo ''
echo "Now retrieving .ZSHRC..."
curl https:/raw.githubusercontent.com/pherondk/dotfiles/master/.zshrc > $HOME/.zshrc-dotfiles

# vimrc vundle install
# echo ''
# echo "Now installing vundle..."
# echo ''
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Pathogen install
# echo ''
# echo "Now installing Pathogen..."
# echo ''
# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Nerdtree for vim install
echo ''
echo "Now installing Nerdtree for Vim..."
echo ''
git clone https://github.com/scrooloose/nerdtree.git ~/.config/nvim/bundle/nerdtree

# Vim color scheme install
echo ''
echo "Now installing vim wombat color scheme..."
echo ''
git clone https://github.com/sheerun/vim-wombat-scheme.git ~/.config/nvim/colors/wombat 
mv ~/.config/nvim/colors/wombat/colors/* ~/.config/nvim/colors/

# Apps to install

apps=(
		'mc' 'appcleaner' 'microsoft-edge' 'middleclick' 'openemu'
		'powershell' 'sound-control' 'spotify' 'synergy' 'iterm2'
		'vmware-remote-console'	'the-unarchiver' '1password'
		'alfred' 'authy' 'bartender' 'mc' 'jq' 'speedtest-cli'
		'bat' 'ccze' 'fzf' 'googler' 'rtv' 'rigrep''reattach-to-user-namespace'
		'tmux' )

for i in ${apps[@]}; do
		echo "Installing $i ..."
		brew search $i
		# brew cask install $i
		echo ''
done


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
