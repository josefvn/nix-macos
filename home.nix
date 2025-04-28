{ config, pkgs, ... }:

{
  home.username = "josef.vanniekerk";
  home.homeDirectory = "/Users/josef.vanniekerk";


  home.packages = [
    pkgs.bat
    pkgs.go-task
    pkgs.jq
    pkgs.lazydocker
    pkgs.lazygit
    pkgs.tree
    pkgs.htop
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
