{ config, pkgs, inputs, ... }:

{
  programs.noctalia-shell = {
    settings = {
      location.name = "Paris, France";

      colorSchemes = {
        predefinedScheme = "Noctalia (default)";
        darkMode = true;
      };

      wallpaper = {
        enabled = true;
        directory = "/home/sven/Pictures/wallpapers";
        randomEnabled = true;
        randomIntervalSec = 300;
        transitionDuration = 1500;
        fillMode = "crop";
      };

      bar = {
        position = "top";
        density = "default";
      };

      controlCenter = {
        diskPath = "/";
      };
    };
  };
}
