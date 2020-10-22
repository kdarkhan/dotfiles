fish_vi_key_bindings
set -gx EDITOR vim
set -gx VISUAL vim
set -gx PATH $HOME/npm/bin $HOME/go/bin $HOME/bin $HOME/.local/bin $PATH
starship init fish | source
