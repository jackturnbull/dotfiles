{
  enable = true;

  shellInit = builtins.readFile ./sources/config.fish;

  shellAbbrs = {
    ls = "exa";
  };
}
