curl -fsSL https://pixi.sh/install.sh | bash

source .bash_profile

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


# Install nvim configs
git clone https://github.com/Alessandro201/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim


# Install rye
curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
source .bash_profile
mkdir -p ~/.config/fish/completions/
rye self completion -s fish > ~/.config/fish/completions/rye.fish

cat ./config.fish > ~/.config/fish/config.fish

fish ./new_install_setup.fish

