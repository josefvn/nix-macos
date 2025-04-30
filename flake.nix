{
  description = "Home Manager configuration of josef.vanniekerk";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = { nixpkgs, home-manager, mac-app-util, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      dotfiles = ./dotfiles;

    in {
      homeConfigurations."my-nix" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          mac-app-util.homeManagerModules.default
          ({ config, pkgs, ... }: {
            # TODO: Make the username and homeDirectory dynamic.
            home.username = "josef.vanniekerk";
            home.homeDirectory = "/Users/josef.vanniekerk";

            home.packages = [
              pkgs.alacritty
              pkgs.bat
              pkgs.go-task
              pkgs.home-manager
              pkgs.htop
              pkgs.jq
              pkgs.lazydocker
              pkgs.lazygit
              pkgs.nerd-fonts.fira-code
              pkgs.tmux
              pkgs.tree
            ];

            home.file = {
              ".config/alacritty/alacritty.toml".source = "${dotfiles}/.config/alacritty/alacritty.toml";
              ".ideavimrc".source = "${dotfiles}/.ideavimrc";
              ".tmux.conf".source = "${dotfiles}/.tmux.conf";
            };

            home.sessionVariables = {};
            home.stateVersion = "24.11";
          })
        ];
      };
    };
}
