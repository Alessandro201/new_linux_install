# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# PIXI globally installed programs
export PATH=/home/apoletti/.pixi/bin:$PATH

# User specific programs
export PATH="$HOME/Programs:$PATH"

export EDITOR="nvim"
export NXF_SINGULARITY_CACHEDIR='/work/apoletti/2_SingularityImages/'


if [[ $- == *i* ]] ; then 
	# Source rye
	if [ -f "$FILE" ]; then 
		source "/home/apoletti/.rye/env"
	fi

	alias l="eza -l -a --group-directories-first -H --color=always "
	alias ll="eza -l -a --group-directories-first -H --total-size --color=always "
	alias btop="$HOME/Programs/btop/bin/btop"

	# Open fish at the start of an interactive session
	#
	if [ "${FISH_VERSION:-unset}" = "unset" ]; then
		if [ command -v fish 2>&1 >/dev/null ]; then
			export SHELL='fish'
			[ -z "$FISH_VERSION" ] && exec $SHELL -l
		fi
	fi
fi

if [ -f "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi
