{ ... }:

{
  xdg.dataFile."nvim/site/autoload/plug.vim".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
  };
  xdg.configFile."nvim/init.vim".source = ./sources/init.vim;
  xdg.configFile."nvim/after/plugin/coc.vim".source = ./sources/after/plugin/coc.vim;
}
