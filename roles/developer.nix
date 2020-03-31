{ config, lib, pkgs, attrsets, ... }:

{
  imports = [
    ../programs/base16-shell/sources.nix
    ../programs/fish/sources.nix
    ../programs/nvim/sources.nix
    ../programs/tmux/sources.nix
    ../programs/iterm/sources.nix
    ../programs/karabiner/sources.nix
    ../programs/brew/sources.nix
  ];

  programs.fish = lib.attrsets.recursiveUpdate(import ../programs/fish/default.nix) {};
  programs.starship = lib.attrsets.recursiveUpdate(import ../programs/starship/default.nix) {};
  programs.tmux = lib.attrsets.recursiveUpdate(import ../programs/tmux/default.nix) {};

  home.packages = with pkgs; [
    ## TOOL
    broot
    exa
    jq
    ripgrep
    tokei
    yarn

    ## PRODUCTIVITY
    jrnl

    ## LANGUAGE
    nodejs
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    HOMEBREW_BUNDLE_FILE = "$HOME/.config/brew/Brewfile";
    TMUX_TMPDIR = "/private/tmp";
  };
}
