{ config, pkgs, inputs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./kitty.nix
    ./nvim.nix
    ./devops.nix
    ./hyprland.nix
    ./niri.nix
    ./noctalia.nix
    ./element.nix
    ./firefox.nix
    ./sshConfig.nix
    ./dolphin.nix
    inputs.noctalia.homeModules.default
    ];

# =========================================
# MODULES TOGGLE — activer/désactiver ici
# =========================================
programs.kitty.enable           = true;
programs.zsh.enable             = true;
programs.zsh.oh-my-zsh.enable   = true;
programs.git.enable             = true;
programs.neovim.enable          = true;
programs.gpg.enable             = true;
programs.fzf.enable             = true;
programs.noctalia-shell.enable  = true;
programs.gh.enable              = true;
programs.firefox.enable         = true;
programs.ssh.enable             = true;

services.gpg-agent.enable       = true;
wayland.windowManager.hyprland.enable = true;

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
    proton-vpn
    proton-pass
    protonmail-desktop
    teams-for-linux
    wl-clipboard
    claude-code
    libreoffice
  ];

  services.gpg-agent = {
    enableSshSupport  = true;
    enableExtraSocket = true;
    pinentry.package  = pkgs.pinentry-tty;
  };

 programs.fzf = {
    enableZshIntegration = true;
  };

  home = {
    username = "sven";
    homeDirectory = "/home/sven";
    file."pictures/wallpapers".source = ./wallpapers;
  };

  xdg.userDirs = {
  enable = true;
  setSessionVariables = false;
  createDirectories = true;
  desktop = "${config.home.homeDirectory}/desktop";
  documents = "${config.home.homeDirectory}/documents";
  download = "${config.home.homeDirectory}/downloads";
  music = "${config.home.homeDirectory}/music";
  pictures = "${config.home.homeDirectory}/pictures";
  publicShare = "${config.home.homeDirectory}/public";
  templates = "${config.home.homeDirectory}/templates";
  videos = "${config.home.homeDirectory}/videos";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze;
    };
  };


  home.stateVersion  = "24.11";
}
