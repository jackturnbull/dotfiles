{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "20.09";

  imports = [
   ./machines/brendan.nix
   ./roles/developer.nix
   ./users/jackturnbull.nix
  ];
}
