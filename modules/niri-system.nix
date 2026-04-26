{ config, lib, pkgs, inputs, ... }:
{
  options.modules.niri.enable = lib.mkEnableOption "niri";

  # imports doit être DEHORS du mkIf
  imports = [ inputs.niri.nixosModules.niri ];

  config = lib.mkIf config.modules.niri.enable {
    programs.niri.enable = true;

    xdg.portal = {
      enable       = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ];
    };

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
  };
}
