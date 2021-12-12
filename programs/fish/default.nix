{
  enable = true;

  loginShellInit = builtins.readFile ./sources/login.fish;

  interactiveShellInit = builtins.readFile ./sources/interactive.fish;

  shellAbbrs = {
    bbi = "brew bundle install --verbose";
    hm = "home-manager switch";
    ls = "exa";
    tm = "tmuxinator start default (basename $PWD | tr -cd '[:alnum:]_-')";
  };
}
