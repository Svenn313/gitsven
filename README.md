# NixOS Configuration

Personal NixOS configuration using flakes and Home Manager, for a laptop with hybrid GPU (Intel + NVIDIA), full disk encryption, and a Wayland-first desktop built around Niri and Noctalia.

## System Overview

| Component | Value |
|---|---|
| OS | NixOS (nixos-unstable) |
| Architecture | x86_64-linux |
| Hostname | laptop |
| Shell | Zsh |
| Terminal | Ghostty (default) |
| Display Server | Wayland (XWayland available via xwayland-satellite) |
| Login Manager | greetd + Noctalia Greeter |
| Window Manager | Niri |
| Desktop Shell | Noctalia |
| Editor | Neovim |
| Theme | Gruvbox |

## Features

- **Declarative configuration** via flakes + Home Manager
- **Full disk encryption (LUKS)** + TPM 2.0 support
- **Hybrid NVIDIA + Intel GPU**
- **PipeWire** audio stack
- **Niri**: tiling Wayland compositor, with spring animations and custom blur (KDL window-rule manually injected into the generated config)
- **Noctalia**: full desktop shell (bar, dock, lock screen, notifications, OSD, wallpaper engine) + **Noctalia Greeter** for the login screen, synced with the session's theme/wallpaper
- **Gruvbox theme** applied consistently (custom palette applied to Noctalia)
- **French AZERTY** keyboard layout, Europe/Paris timezone
- **SSH** on a non-standard port, key-only authentication
- **GNOME Keyring** for Electron apps
- **Random wallpaper rotation** every 5 minutes via Noctalia

## Desktop Stack

| Role | Tool |
|---|---|
| Wayland compositor | [Niri](https://github.com/YaLTeR/niri) (via [niri-flake](https://github.com/sodiboo/niri-flake)) |
| Desktop shell | [Noctalia](https://github.com/noctalia-dev/noctalia) |
| Login screen | [Noctalia Greeter](https://github.com/noctalia-dev/noctalia-greeter) |
| File manager | Dolphin (KDE) |
| Launcher | Built into Noctalia |
| Screenshots | Grim |
| Notifications | Built into Noctalia |
| Screen lock | Noctalia (`noctalia msg session lock`) |
| Cursor theme | Bibata-Modern-Classic |

## Development & DevOps

> ⚠️ These tools are installed by default (`modules/home/devops.nix`) but **Terraform, Ansible, and Kubernetes are no longer actively used** — kept in the config out of habit / just in case, not cleaned up yet.

**Provisioning** (not currently used)
- Ansible, Terraform, terraform-docs, tflint, Terragrunt

**Containers**
- Docker, docker-compose, kubectl, kubectx, minikube, k9s, Helm *(k8s not currently used)*

**Networking**
- inetutils, wireguard-tools, nmap, dig, httpie

**Secrets / Credentials**
- Vault, SOPS

**System Monitoring**
- htop, ncdu, iotop, nethogs, lazydocker

**Data / Parsing**
- jq, yq, fx

**Editor & terminal**
- Neovim, Ghostty (default), Kitty
- brightnessctl, imagemagick, ffmpeg, python3

## Repo Structure

```
.
├── flake.nix                      # Main entry point, defines inputs and the nixosConfigurations output
├── flake.lock
├── hosts/
│   └── laptop/
│       ├── configuration.nix      # System config for the "laptop" host
│       └── hardware-configuration.nix
├── modules/                       # System-level modules (NixOS)
│   ├── audio.nix
│   ├── bluetooth.nix
│   ├── docker.nix
│   ├── fonts.nix
│   ├── locale.nix
│   ├── networking.nix
│   ├── niri-system.nix            # Enables Niri at the system level + polkit, XDG portals
│   ├── nvidia.nix
│   ├── ssh.nix
│   └── home/                      # Home Manager modules (user-level config)
│       ├── devops.nix
│       ├── dolphin.nix
│       ├── element.nix
│       ├── firefox.nix
│       ├── ghostty.nix
│       ├── git.nix
│       ├── home.nix               # Home Manager entry point
│       ├── kitty.nix
│       ├── niri.nix                # Niri config (binds, layout, animations, spawn-at-startup)
│       ├── noctalia.nix
│       ├── noctalia/
│       │   ├── noctalia-config.toml
│       │   └── noctalia-palette.json
│       ├── nvim.nix
│       ├── sshConfig.nix
│       ├── wallpapers/            # ~130 wallpapers for Noctalia's rotation
│       └── zsh.nix
└── README.md
```

## Notes / Gotchas

- **Greeter**: after changing the wallpaper or theme, a manual sync is required (Noctalia Settings → Security → Noctalia Greeter → Sync Now), or enable auto-sync. The greeter never reads `~/pictures/wallpapers` directly.
- **SSH host key** (`/etc/ssh/ssh_host_ed25519_key`): auto-generated on first boot, unique to this machine. Not versioned (as expected — never version this).
- **Personal GPG/SSH keys**: keys are restored manually from an external backup after a reinstall — not managed declaratively yet.

## Installation / Reproduction

```bash
git clone git@github.com:Svenn313/gitsven.git /etc/nixos
cd /etc/nixos
sudo nixos-rebuild switch --flake .#laptop
```

After a reinstall, remember to manually restore:
- Personal SSH and GPG keys (from an external backup)
- Run a Noctalia Greeter sync once the session is up
