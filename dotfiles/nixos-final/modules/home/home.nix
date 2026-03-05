{ config, pkgs, inputs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./kitty.nix
    ./nvim.nix
    ./devops.nix
    ./hyprland.nix
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      location.name = "Paris, France";
    };
  };

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

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable            = true;
    enableSshSupport  = true;
    enableExtraSocket = true;
    pinentry.package  = pkgs.pinentry-tty;
  };

  programs.fzf = {
    enable               = true;
    enableZshIntegration = true;
  };

  home.username      = "sven";
  home.homeDirectory = "/home/sven";
  home.stateVersion  = "24.11";
}
