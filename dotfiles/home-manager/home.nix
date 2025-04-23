{ config, pkgs, ... }:

{
  # Define the username and home directory
  home.username = "sven";
  home.homeDirectory = "/home/sven";

  # Import packages from different configuration files
  imports = [
    ./nvim.nix
    ./git.nix
    ./zsh.nix
    ./wofi/wofi.nix
    ./hypr/hyprland.nix
    ./hypr/waybar/waybar.nix
    ./hypr/hyprlock.nix
    ./hypr/hyprpaper.nix
    #   ./stylix.nix
  ];

  # List of packages to install for the user
  home.packages = with pkgs; [
    btop
    sops
    tree
    ripgrep
    wget
    curl
    firefox
    vlc
    gcc
    bat
    networkmanagerapplet
    blueman
    pamixer
    pavucontrol
    telegram-desktop
    discord
    protonvpn-gui
    proton-pass
    protonmail-desktop
    unzip
    stylua
    hyprland
    wl-clipboard
    dunst
    hypridle
    waybar
    hyprlock
    hyprpaper
    wlogout
  ];

  # Enable some other packages
  # Hyprland
  wayland.windowManager.hyprland.enable = true;

  # Wofi
  programs.wofi = {
    enable = true;
    settings = { allow_images = true; };
  };

  # Kitty
  programs.kitty.enable = true;

  # fzf
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Allow Unfree packages
  nixpkgs.config.allowUnfree = true;

  # State version for compatibility and migration tracking
  home.stateVersion = "24.11";
}
