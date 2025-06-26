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
    ./devops.nix
  ];

  # List of packages to install for the user
  home.packages = with pkgs; [
    btop
    tree
    kitty
    ripgrep
    firefox
    vlc
    gcc
    bat
    networkmanagerapplet
    telegram-desktop
    discord
    protonvpn-gui
    proton-pass
    protonmail-desktop
    stylua
    gtk-engine-murrine
    gnome-themes-extra
    orchis-theme
    nix-prefetch-git
    devenv
  ];

  # Enable GPG
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  # Set wallpaper using gsettings via dconf
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/sven/Pictures/wallpaper.jpg";
      picture-uri-dark = "file:///home/sven/Pictures/wallpaper.jpg";
      picture-options = "fit";
    };
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
