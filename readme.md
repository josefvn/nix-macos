# Nix macOS configuration

Install Nix with:
```
sh <(curl -L https://nixos.org/nix/install)
```

Initialise Home Manager with:
```
nix run home-manager -- init --switch
```

Copy the files to `~/Projects/nix-macos`.

Activate configuration with:
```
home-manager switch --flake .#josef.vanniekerk

