#/bin/bash

# Install pixi
curl -fsSL https://pixi.sh/install.sh | bash

if test -f $HOME/.bash_profile ; then
    source $HOME/.bash_profile
fi

pixi global install nvim
pixi global install fd-find
pixi global install fzf
pixi global install ripgrep
pixi global install eza
pixi global install bat
pixi global install ruff
pixi global install jq
pixi global install tmux
pixi global install fish
pixi global install git


# Install nvim configs
git clone https://github.com/Alessandro201/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim


# Install rye
curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash


if test -f $HOME/.bash_profile ; then
    source $HOME/.bash_profile
fi

mkdir -p $HOME/.config/fish/completions/
rye self completion -s fish > $HOME/.config/fish/completions/rye.fish

# Add fish configs and make it start when a new shell opens
cp ./config.fish $HOME/.config/fish/config.fish

# Create backup of bashrc, and add a number to the end if the backup already exists
name="$HOME/.bashrc"
if [[ -e $name.bak || -L $name.bak ]] ; then
    i=0
    while [[ -e $name-$i.bak || -L $name-$i.bak ]] ; do
        let i++
    done
    name=$name-$i
fi

mv $HOME/.bashrc "$name".bak
cp .bashrc $HOME/.bashrc


name="$HOME/.bash_profile"
if [[ -e $name.bak || -L $name.bak ]] ; then
    i=0
    while [[ -e $name-$i.bak || -L $name-$i.bak ]] ; do
        let i++
    done
    name=$name-$i
fi

mv $HOME/.bash_profile "$name".bak
cp .bash_profile $HOME/.bash_profile

# Fish setup
fish ./2_new_install_setup.fish

