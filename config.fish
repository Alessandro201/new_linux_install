# Remove greeting
set --erase fish_greeting
set fish_greeting

# Set default editor
set --export EDITOR "nvim" 

# Commands to execute if the shell is interactive
if status is-interactive
  # Aliases
  alias l="eza -l -a --group-directories-first -H --time-style "long-iso" "


  ## >>>> Set up fzf (and its key bindings)
  ##
  fzf --fish | source

  # Default options for FZF
  set --export FZF_DEFAULT_OPTS '--exact --cycle --layout=reverse --border --height=90% --marker="*"
     --bind "ctrl-/:change-preview-window(down|hidden|),ctrl-w:toggle-preview-wrap"'

  # The command to get the files to pass to fzf when pressing ctrl+t
  set --export FZF_CTRL_T_COMMAND 'fd . / --exclude ".git" --hidden --no-ignore --color=auto'
  # The options to pass to fzf when pressing ctrl+t
  set --export FZF_CTRL_T_OPTS "
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|),ctrl-w:toggle-preview-wrap'"

  # Set up how fzf.fish Search Directory command (ctrl + f) gets the files. 
  # I want all files and directories aside from .git/* in the current path
  set fzf_fd_opts --hidden --no-ignore --color=always --exclude ".git"

  # Change how directories are previewed when using fzf.fish
  # set fzf_preview_dir_cmd eza --all --color=always --long --no-user --no-permissions --group-directories-first --time-style "long-iso" 
  set fzf_preview_dir_cmd tree -C {} | head -n 50
  # Change how files are previewed when using fzf.fish
  set fzf_preview_file_cmd bat --color=always

  # CTRL+V to open fzf with current environment variables
  # CTRL+F to search files in current directory
  # CTRL+O to open fzf with current processes
  fzf_configure_bindings --processes=\e\co
  fzf_configure_bindings --variables=\e\cv
  fzf_configure_bindings --directory=\cf
  set fzf_directory_opts -e
  set fzf_git_log_opts -e
  set fzf_git_status_opts -e
  set fzf_history_opts -e
  set fzf_processes_opts -e
  set fzf_variables_opts -e
  ##
  ## <<<<< Finished FZF setup


  # Setup bobthefish theme
  set -g theme_nerd_fonts yes
  set -g theme_color_scheme dark

  # Keybindings to delete words by pressing ctrl+backspace and something else which I don't remember
  bind \e\[3\;5~ kill-word
  bind \b backward-kill-word
  bind \cw kill-word
  bind \cb backward-kill-word

  # Add pixi completions to fish
  pixi completion --shell fish | source

end
