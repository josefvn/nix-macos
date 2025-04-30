# Nix macOS configuration

## Installation

First install Nix using the following command:

```zsh
chmod +x ./install
./install
```

Next, **restart your terminal** and run the following command to perform the **initial activation**:

```zsh
# This command builds your configuration and activates it for the first time.
# It also installs the 'home-manager' command itself via your flake.nix.
nix run home-manager -- switch --flake .#my-nix
```

After this command succeeds, the `home-manager` command will be available in your PATH. For future updates to your configuration, **restart your terminal** and then simply run:

```zsh
home-manager switch --flake .#my-nix
```

## Uninstallation

To completely uninstall the configuration including Nix, execute the following:

```zsh
chmod +x ./uninstall
./uninstall
```
```
