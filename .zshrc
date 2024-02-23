# } Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function precmd() {
if [[ $TERM != linux ]]; then
    print -Pn "\e]2;%~\a"
fi
}

preexec () {
if [[ $TERM != linux ]]; then
print -Pn "\e]2;%~ :  $1\a"
fi
}


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
export PATH=$HOME/bin:/usr/local/bin:/usr/local/Cellar:/home/heretic/Library/Python/3.7/bin:/home/heretic/.cargo/bin:/home/heretic/.android-sdk-macosx/platform-tools/:$PATH
elif [[ "$OSTYPE" == "darwin"* ]]; then 
export PATH=$HOME/bin:/usr/local/bin:/usr/local/Cellar:/Users/heretic/Library/Python/3.7/bin:/Users/heretic/.cargo/bin:/Users/heretic/.android-sdk-macosx/platform-tools/:$PATH
fi

export DISABLE_AUTO_TITLE='true'

# panes
# set -g pane-border-fg black
# set -g pane-active-border-fg brightred


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="steeef"
ZSH_THEME="powerlevel10k/powerlevel10k"

# POWERLEVEL10K_CONTEXT_TEMPLATE="%n@`hostname -f`"
# POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
# POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
# POWERLEVEL9K_CONTEXT_TEMPLATE="%4>>%n%>>@%7>>%m%>>"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
docker
docker-compose
)

source $ZSH/oh-my-zsh.sh

# FZF history
#
# fzf-history-widget-accept() {
  # fzf-history-widget
  # zle accept-line
# }
# zle     -N     fzf-history-widget-accept
# bindkey '^X^R' fzf-history-widget-accept
#
# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias tcpdump='sudo tcpdump'
#
# ##################################################################
#  FZF Exports
# ##################################################################

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --select-1 --exit-0"
export FZF_BREW_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || brew info {}) 2> /dev/null | head -200' --select-1 --exit-0"
export FZF_TMUX=1
FZF_TMUX_OPTS='-p 65%'

# ##################################################################
# Source
# ##################################################################
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
# [ ! -f $HOME/git/fzf-tab-completion/zsh/fzf-zsh-completion.sh ] || source $HOME/git/fzf-tab-completion/zsh/fzf-zsh-completion.sh 
[ -f $HOME/.zsh_aliases ] && source $HOME/.zsh_aliases
[ -f $HOME/.zsh_functions ] && source $HOME/.zsh_functions
[ -f $HOME/.git_functions ] && source $HOME/.git_functions
[ -f $HOME/.mymacros.bash ] && source $HOME/.mymacros.bash
[ -f $HOME/git/forgit/forgit.plugin.zsh ] && source $HOME/git/forgit/forgit.plugin.zsh
[ -f /usr/local/share/zsh-syntax-highlightint/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
