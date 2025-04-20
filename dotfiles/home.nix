{ config, pkgs, ... }:

{
  # Define the username and home directory
  home.username = "sven";
  home.homeDirectory = "/home/sven";

  # Enable Zsh as the user shell
  programs.zsh.enable = true;

  # Enable and configure Git with user details
  programs.git = {
    enable = true;
    userName = "svenn313";
    userEmail = "sven313@protonmail.com";
  };

  # List of packages to install for the user
  home.packages = with pkgs; [
    btop
    wget
    curl
    git
    firefox
    vlc
    bat
  ];

  # Import packages from differents configuration file
  imports = [
    ./neovim.nix
  ];

  # State version for compatibility and migration tracking
  home.stateVersion = "24.11";
}

