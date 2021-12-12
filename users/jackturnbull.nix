{ config, lib, attrsets, ... }:

{
  home.username = "jackturnbull";
  home.homeDirectory = "/Users/jackturnbull";

  programs.git = lib.attrsets.recursiveUpdate(import ../programs/git/default.nix) {
    userEmail = "git@jack.codes";
    userName = "Jack Turnbull";
  };
}
