set fish_function_path $fish_function_path $HOME/.config/fish/plugin-foreign-env/functions
fenv source '$HOME/.nix-profile/etc/profile.d/nix.sh'
set PATH $HOME/.local/bin $PATH

any-nix-shell fish --info-right | source

source (anyenv init -|psub)
