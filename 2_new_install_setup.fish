###################################### IN FISH

# Add completions to fish
echo 'pixi completion --shell fish | source' >> ~/.config/fish/config.fish

# Add rye shims to path
set -Ua fish_user_paths "$HOME/.rye/shims"


# Install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# install fish.fzf
fisher install PatrickF1/fzf.fish

# Install ohmyfish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Install the theme
omf install bobthefish
echo "If you have any problems visualizing the icons you need to install a nerdfont"
echo "Refer to https://github.com/oh-my-fish/theme-bobthefish"





