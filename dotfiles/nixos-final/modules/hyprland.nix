{ config, lib, pkgs, noctalia-shell, ... }:

{
  options.modules.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.modules.hyprland.enable {

    programs.hyprland = {
      enable          = true;
      xwayland.enable = true;
    };

    services.sddm = {
      enable         = true;
      wayland.enable = true;
    };

    xdg.portal = {
      enable       = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

    environment.systemPackages = with pkgs; [
      noctalia-shell.packages.${pkgs.system}.default
      brightnessctl
      imagemagick
      ffmpeg
      python3
      qt6.qtmultimedia
      kdePackages.dolphin
      grim
    ];
  };
}
