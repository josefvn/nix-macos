{ config, pkgs, ... }:

let
  dotfiles = ./dotfiles;
in
{
  home.username = "josef.vanniekerk";
  home.homeDirectory = "/Users/josef.vanniekerk";

  home.stateVersion = "24.11";

  home.packages = [
    pkgs.bat
    pkgs.go-task
    pkgs.jq
    pkgs.lazydocker
    pkgs.lazygit
    pkgs.tree
    pkgs.htop
    pkgs.tmux
  ];

  home.file = {
    ".config/ghostty/config".source = "${dotfiles}/.config/ghostty/config";
    ".ideavimrc".source = "${dotfiles}/.ideavimrc";
    ".tmux.conf".source = "${dotfiles}/.tmux.conf";
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
