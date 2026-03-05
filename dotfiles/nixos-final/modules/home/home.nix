{ config, pkgs, inputs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./kitty.nix
    ./nvim.nix
    ./devops.nix
    ./hyprland.nix
    ./noctalia.nix
    inputs.noctalia.homeModules.default
  ];


# =========================================
# MODULES TOGGLE — activer/désactiver ici
# =========================================
programs.kitty.enable          = true;
programs.zsh.enable            = true;
programs.zsh.oh-my-zsh.enable  = true;
programs.git.enable            = true;
programs.neovim.enable         = true;
programs.gpg.enable            = true;
programs.fzf.enable            = true;
programs.noctalia-shell.enable = true;

services.gpg-agent.enable      = true;

# =========================================

# =========================================

  home.packages = with pkgs; [
    btop
    tree
    ripgrep
    firefox
    vlc
    gcc
    bat
    networkmanagerapplet
    telegram-desktop
    element-desktop
    signal-desktop
    discord
    protonvpn-gui
    proton-pass
    protonmail-desktop
  ];

  services.gpg-agent = {
    enableSshSupport  = true;
    enableExtraSocket = true;
    pinentry.package  = pkgs.pinentry-tty;
  };

 programs.fzf = {
    enableZshIntegration = true;
  };

  home.username      = "sven";
  home.homeDirectory = "/home/sven";
  home.stateVersion  = "24.11";
}
