{ config, lib, pkgs, attrsets, ... }:

{
  imports = [
    ../programs/base16-shell/sources.nix
    ../programs/brew/sources.nix
    ../programs/fish/sources.nix
    ../programs/iterm/sources.nix
    ../programs/nvim/sources.nix
    ../programs/tmux/sources.nix
  ];

  programs.fish = lib.attrsets.recursiveUpdate(import ../programs/fish/default.nix) {};
  programs.starship = lib.attrsets.recursiveUpdate(import ../programs/starship/default.nix) {};
  programs.tmux = lib.attrsets.recursiveUpdate(import ../programs/tmux/default.nix) {};

  home.packages = with pkgs; [
    ## TOOL
    any-nix-shell
    aws
    cloc
    dbmate
    doctl
    exa
    git-crypt
    gnupg
    go-ethereum
    jq
    neovim
    ripgrep
    terraform
    terraform-providers.aws
    websocat
    yarn

    ## SYSTEM LANGUAGES
    go
    nodejs-16_x
    python39
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    HOMEBREW_BUNDLE_FILE = "$HOME/.config/brew/Brewfile";
    TMUX_TMPDIR = "/private/tmp";
  };
}
