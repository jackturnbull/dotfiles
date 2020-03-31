{ pkgs, fetchurl, ... }:

{
  xdg.configFile."brew/Brewfile".source = ./sources/Brewfile;
}
