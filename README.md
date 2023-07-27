# Minimal NixOS i3 Configuration

> Currently no power management included in the UI 

This repository contains a minimal setup for NixOS with i3 window manager, Alacritty, Polybar and Rofi.

## Installation

1. Clone the git repository
2. Copy the file [`configuration.nix`](https://github.com/mxcom/nixos-i3wm/blob/main/nixos/configuration.nix) to `/etc/nixos/`
3. Run the following command to update you NixOS configuration

```console
sudo nixos-rebuild switch
```

3. Copy the contents of the `config` folder to `~/.config/`. This includes configurations for i3, Alacritty, Polybar and Rofi
4. Log-Out and Log-In again to make the changes apply (Maybe `Meta+Shift+r` already makes all changes apply)
