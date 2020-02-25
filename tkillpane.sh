#!/usr/bin/env /bin/bash
#
# -*- shell-script -*-
#
# source tkillpane.sh
#
tkillpane () {
		local inst=$(tmux list-panes | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[tmux:kill-pane]'")
		if [[ -n $inst ]]
		then
				for pane in $(echo $inst)
				do
						killpane=$(echo $pane | awk '{ print $1 }')
						tmux kill-pane -t $killpane
				done
		fi
}
