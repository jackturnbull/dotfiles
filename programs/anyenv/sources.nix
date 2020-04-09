{ ... }:

{
  xdg.configFile."anyenv/anyenv-install".source = builtins.fetchGit {
    url = "https://github.com/anyenv/anyenv-install.git";
    rev = "dcbcfe1cfd3a591c0080e3e21fb300c0e842b29a";
  };
}
