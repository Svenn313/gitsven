# NixOS Configuration

Personal NixOS configuration using flakes and Home Manager for a laptop with dual GPU (Intel + NVIDIA), full disk encryption, and a Wayland-first desktop.

## System Overview

| Component | Value |
|---|---|
| OS | NixOS (nixos-unstable) |
| Architecture | x86_64-linux |
| Hostname | laptop |
| Shell | Zsh + Powerlevel10k |
| Terminal | Kitty |
| Display Server | Wayland (XWayland available) |
| Login Manager | SDDM (astronaut theme) |
| Window Managers | Hyprland / Niri |
| Desktop Shell | Noctalia |
| Editor | Neovim |
| Theme | Catppuccin Mocha |

## Features

- **Flakes-based** declarative configuration with Home Manager
- **LUKS full disk encryption** + TPM 2.0 support
- **NVIDIA PRIME sync** with Intel iGPU for hybrid graphics
- **PipeWire** audio stack
- **Dual WM setup**: Hyprland (tiling + animations) and Niri (default session)
- **Catppuccin Mocha** theme throughout (Neovim, Dolphin, terminal, Qt/GTK)
- **French AZERTY** keyboard layout, Europe/Paris timezone
- **SSH** on non-standard port, key-only authentication

## Desktop Stack

| Role | Tool |
|---|---|
| Window manager | [Hyprland](https://hyprland.org/) / [Niri](https://github.com/YaLTeR/niri) |
| Desktop shell | [Noctalia](https://noctalia.app/) |
| File manager | Dolphin |
| Launcher | Noctalia integrated |
| Screenshot | Grim |
| Notifications | Noctalia |
| Wallpapers | Random rotation every 5 min via Noctalia |

## Development & DevOps Tooling

**Infrastructure**
- Ansible, Terraform, Terragrunt, tflint, terraform-docs

**Containers & Kubernetes**
- Docker, docker-compose, kubectl, kubectx, minikube, k9s, Helm

**Secrets & Vault**
- HashiCorp Vault, SOPS

**CLI Utilities**
- jq, yq, fx, httpie, nmap, wireguard-tools, htop, ncdu, lazydocker, bat

## Applications

- Firefox (uBlock Origin, Proton Pass, Proton VPN)
- Element Desktop (Matrix)
- Signal, Telegram, Discord
- LibreOffice, VLC
- Claude Code CLI

## Neovim

- Colorscheme: Catppuccin Mocha
- LSP: `nixd`, `pyright`, `lua_ls`, `bashls`, `yamlls`
- Plugins: nvim-tree, Telescope, nvim-cmp, lualine, gitsigns, markdown-preview

## Shell Functions

```zsh
rebuild   # nixos-rebuild switch --flake /etc/nixos
update    # update flake inputs then rebuild
nixgc     # nix garbage collection
nixdir    # cd /etc/nixos
```

## Structure

```
/etc/nixos/
├── flake.nix              # Flake inputs and outputs
├── configuration.nix      # System-level configuration
├── hardware-configuration.nix
└── modules/
    ├── system/            # System modules (GPU, audio, networking…)
    └── home/              # Home Manager modules (apps, shell, themes…)
        └── wallpapers/    # Wallpaper collection
```

## Flake Inputs

| Input | Purpose |
|---|---|
| nixpkgs | nixos-unstable channel |
| home-manager | User environment management |
| noctalia-shell | Desktop shell |
| noctalia-qs | Quick settings panel |
| niri-flake | Niri window manager |
| NUR | Nix User Repository |

## Quick Start

```bash
# Clone to /etc/nixos
git clone <repo-url> /etc/nixos

# Build and switch
nixos-rebuild switch --flake /etc/nixos
```

> Requires NixOS with flakes enabled (`experimental-features = nix-command flakes`).
