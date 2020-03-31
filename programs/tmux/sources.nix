{ ... }:

{
  home.file.".tmux.conf".source = ./sources/tmux.conf;
  xdg.configFile."fish/completions/tmuxinator.fish".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.fish";
  };
  xdg.configFile."tmuxinator/default.yml".source = ./sources/default.yml;
}
