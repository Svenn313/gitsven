{ config, lib, pkgs, inputs, ... }:

{
  options.modules.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.modules.hyprland.enable {

    programs.hyprland = {
      enable          = true;
      xwayland.enable = true;
    };

    services.displayManager.sddm = {
      enable         = true;
      wayland.enable = true;
      settings.General.InputMethod = "";
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

    services.power-profiles-daemon.enable = true;
    services.upower.enable                = true;
  };
}
