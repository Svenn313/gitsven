{ config, lib, pkgs, inputs, ... }:
{
  imports = [ inputs.umbriel.nixosModules.default ];

  security.polkit.enable              = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock      = {};

  environment.systemPackages = with pkgs; [
    brightnessctl
    imagemagick
    ffmpeg
    python3
    kdePackages.dolphin
    grim
    bibata-cursors
    xwayland-satellite
  ];
}
