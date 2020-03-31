{ config, lib, attrsets, ... }:

{
  programs.git = lib.attrsets.recursiveUpdate(import ../programs/git/default.nix) {
    userEmail = "git@jack.codes";
    userName = "Jack Turnbull";
  };
}
