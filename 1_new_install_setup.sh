#/bin/bash

# Install pixi
curl -fsSL https://pixi.sh/install.sh | bash

source $HOME/.bash_profile

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

source $HOME/.bash_profile

mkdir -p $HOME/.config/fish/completions/
rye self completion -s fish > $HOME/.config/fish/completions/rye.fish


# Add fish configs and make it start when a new shell opens
cat ./config.fish > $HOME/.config/fish/config.fish
echo 'fish' >> $HOME/.bashrc

fish ./2_new_install_setup.fish

