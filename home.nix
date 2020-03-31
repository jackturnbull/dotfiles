{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "19.09";

  imports = [
   ./machines/atiyah.nix
   ./roles/developer.nix
   ./users/jack.nix
  ];
}
