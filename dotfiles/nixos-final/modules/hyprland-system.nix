# System-level Hyprland configuration.
# Only options that MUST be here: programs.hyprland, services.displayManager.sddm
# User configuration (hyprland.conf, keybinds, etc.) is in modules/home/hyprland.nix

{ config, lib, pkgs, inputs, ... }:

{
  options.modules.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.modules.hyprland.enable {

    programs.hyprland = {
      enable          = true;
      xwayland.enable = true;
    };

   services.xserver.xkb = {
      layout  = "fr";
      variant = "azerty";
    };

    xdg.portal = {
      enable       = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

    environment.systemPackages = with pkgs; [
      brightnessctl
      imagemagick
      ffmpeg
      python3
      kdePackages.dolphin
      grim
      ];

services.displayManager.sddm.theme = "noctalia";
    services.power-profiles-daemon.enable = true;
    services.upower.enable                = true;
  };
}
