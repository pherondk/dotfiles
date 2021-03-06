#!/usr/bin/env /bin/bash
#
# -*- shell-script -*-
#
# Use fzf (https://github.com/junegunn/fzf) to rapidly select an account,
# and run 1pass (with optional argument) on the result.
# To use this, source this file in your .bashrc or .profile as appropriate,
# e.g.
#
# source fuzzpass.sh
#

fuzzpass() {
    local arg
	arg=$1
	# leave this section in to see if i can get it working, but otherwise
	# use "password" or "secret key"
    # if [ "$arg" == "" ]; then
    #     arg="password"
    # fi
    local item
    item=$(1pass | fzf);
	echo "$item"
    1pass -p "$item" "$arg"
}
