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

export PATH=$HOME/bin:/usr/local/bin:/usr/local/Cellar:/Users/heretic/Library/Python/3.7/bin:$PATH
export DISABLE_AUTO_TITLE='true'

# panes
# set -g pane-border-fg black
# set -g pane-active-border-fg brightred


# Path to your oh-my-zsh installation.
export ZSH="/Users/heretic/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#  ZSH_THEME="steeef"
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
# ##################################################################
# Aliases
# ##################################################################

alias reload='source ~/.zshrc'
alias ls='ls -alhG'
alias jj='mac'
alias arping='sudo arping'
alias gotosleep='pmset sleepnow'
alias softwareupdate='sudo softwareupdate'
alias attach='tmuxp load saved'
alias cat='bat --color=always'
alias wireless='networksetup -setairportpower en1 '$1''
alias shr='netstat -nr'
alias vi='nvim'
alias extip='wget ipinfo.io/ip -qO -'
alias psaux='ps aux | ccze -A -o nolookups'
alias newsboat='newsboat -C ~/.newsboat/newsboat.cfg -u ~/.newsboat/urls'
alias brewup='brew update && brew upgrade'
alias pscpu='ps aux | sort -nr -k 3'
alias pscpu10='ps aux | sort -nr -k 3 | head -10'
alias psmem='ps aux | sort -nr -k 4'
alias psmem10='ps aux | sort -nr -k 4 | head -10'
alias busy='cat /dev/urandom | hexdump -C | grep "ca fe"'
alias dockip='docker container inspect --format "{{ .NetworkSettings.IPAddress }}" $1'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dcs='docker container start $1'
alias dcst='docker container stop $1'
alias 1pa='op get item $1'
alias b='~/scripts/b.rb'

# SSH Aliases
# #####################################################################
#
alias ymir='/usr/bin/ssh -i /Users/heretic/.ssh/id_rsa.ymir heretic@ymir'
alias lich='ssh -t -i ~/.ssh/id_rsa.lich pheron@lich "/usr/local/bin/zsh;"'
alias yggdrasil='/usr/bin/ssh -i /Users/heretic/.ssh/id_rsa.yggdrasil-root root@yggdrasil'
alias odin='/usr/bin/ssh -i /Users/heretic/.ssh/id_rsa.odin-root root@odin'
alias asmodeus='/usr/bin/ssh -i /Users/heretic/.ssh/id_rsa.asmodeus heretic@asmodeus'
alias erebus='/usr/bin/ssh -i /Users/heretic/.ssh/id_rsa.erebus heretic@erebus'

# Spotify Aliases
# #####################################################################
alias play='spotify play'
alias spop='spotify open'
alias spinfo='spotify info'
alias mute='spotify mute'
alias back='spotify back'
alias next='spotify next'
alias unmute='spotify unmute'
alias lyrics='spotify lyrics'

# ##################################################################
# Functions
# ##################################################################

function notify { terminal-notifier -title "$1" -message "$2" }

function piadd() { ymir -t "pihole -a -r $1 $2" }
function pistatus() { ymir -t "pihole status" }
function piupdate() { ymir -t "pihole --up" }

function _calcram() {
	local sum
	sum=0
	for i in `ps aux | grep -i "$1" | grep -v "grep" | awk '{print $6}'`; do
		sum=$(($i + $sum))
	done
	sum=$(echo "scale=2; $sum / 1024.0" | bc)
	echo $sum
}

function ram() {
	local sum
	local app="$1"
	if [ -z "$app" ]; then
		echo "First argument - pattern to grep from processes"
		return 0
	fi
	sum=$(_calcram $app)
	if [[ $sum != "0" ]]; then
		echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM"
	else
		echo "No active processes matching pattern '${fg[blue]}${app}${reset_color}'"
	fi
}

function rams() {
	local sum
	local app="$1"
	if [ -z "$app" ]; then
		echo "First argument - pattern to grep from processes"
		return 0
	fi

	while true; do
		sum=$(_calcram $app)
		if [[ $sum != "0" ]]; then
                echo -en "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM\r"
        else
                echo -en "No actice processes matching pattern '${fg[blue]}${appt}${reset_color}'\r"
        fi
        sleep 1
  done
}

# for existing aliases
fzf_alias() {
  alias | tr = "\t" | fzf | cut -f 1
}


e () {
        local cols sep
        cols=$(( COLUMNS / 3 ))
        sep='{::}'
        cp -f ~/Library/Application\ Support/Microsoft\ Edge/Default/History /tmp/h
        sqlite3 -separator $sep /tmp/h "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" | awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' | fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# c - browse chrome history
c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}


# -------------------------------------------------------------------
# compressed file expander
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
ex() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutil mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ##################################################################
#  FZF Exports
# ##################################################################

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --select-1 --exit-0"
export FZF_TMUX=1
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"

# ##################################################################
# Source
# ##################################################################
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
source $HOME/git/fzf-marks/fzf-marks.plugin.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
