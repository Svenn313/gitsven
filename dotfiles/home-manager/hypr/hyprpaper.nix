{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      wallpaper = "eDP-1,/home/sven/Pictures/wallpaper.jpg";
    };
  };
}
