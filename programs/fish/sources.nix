{ ... }:

{
  xdg.configFile."fish/functions/fisher.fish".source = builtins.fetchurl {
    url = "https://git.io/fisher";
  };
  xdg.configFile."fish/conf.d/nix-env.fish".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/lilyball/nix-env.fish/master/conf.d/nix-env.fish";
  };
  xdg.configFile."fish/fishfile".source = ./sources/fishfile;
}
