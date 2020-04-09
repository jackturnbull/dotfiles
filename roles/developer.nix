{ config, lib, pkgs, attrsets, ... }:

{
  imports = [
    ../programs/anyenv/sources.nix
    ../programs/base16-shell/sources.nix
    ../programs/brew/sources.nix
    ../programs/fish/sources.nix
    ../programs/iterm/sources.nix
    ../programs/karabiner/sources.nix
    ../programs/jrnl/sources.nix
    ../programs/nvim/sources.nix
    ../programs/tmux/sources.nix
  ];

  programs.fish = lib.attrsets.recursiveUpdate(import ../programs/fish/default.nix) {};
  programs.starship = lib.attrsets.recursiveUpdate(import ../programs/starship/default.nix) {};
  programs.tmux = lib.attrsets.recursiveUpdate(import ../programs/tmux/default.nix) {};

  home.packages = with pkgs; [
    ## TOOL
    any-nix-shell
    broot
    exa
    jq
    ripgrep
    tokei
    yarn

    ## PRODUCTIVITY
    jrnl

    ## SYSTEM LANGUAGES
    nodejs
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    HOMEBREW_BUNDLE_FILE = "$HOME/.config/brew/Brewfile";
    TMUX_TMPDIR = "/private/tmp";
  };
}
