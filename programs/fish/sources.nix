{ ... }:

{
  xdg.configFile."fish/functions/fisher.fish".source = builtins.fetchurl {
    url = "https://git.io/fisher";
  };
  xdg.configFile."fish/plugin-foreign-env".source = builtins.fetchGit {
    url = "https://github.com/oh-my-fish/plugin-foreign-env.git";
    rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
  };
  xdg.configFile."fish/fishfile".source = ./sources/fishfile;
}
