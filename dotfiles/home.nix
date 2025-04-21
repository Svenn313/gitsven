{ config, pkgs, ... }:

{
  # Define the username and home directory
  home.username = "sven";
  home.homeDirectory = "/home/sven";

  # List of packages to install for the user
  home.packages = with pkgs; [
    btop
    sops
    wget
    curl
    firefox
    vlc
    bat
    networkmanagerapplet
    telegram-desktop
    discord
    proton-pass
    protonmail-desktop
  ];

  # Import packages from differents configuration file
  imports = [
    ./neovim.nix
    ./git.nix
    ./zsh.nix
  ];

  # Enable some packages 
  programs.kitty.enable = true;
  programs.home-manager.enable = true;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Add docker
  virtualisation.docker.enable = true;
  users.users.sven.extraGroups = [ "docker" ];

  # State version for compatibility and migration tracking
  home.stateVersion = "24.11";
}

