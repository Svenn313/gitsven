{ config, pkgs, inputs, ... }:

{
  programs.noctalia-shell = {
    settings = {
      location = {
        name = "Paris, France";
        useFahrenheit = false;
        use12hourFormat = false;
      };

      colorSchemes = {
        predefinedScheme = "Catppuccin";
        darkMode = true;
        useWallpaperColors = false;
      };

      general = {
        avatarImage = "/home/sven/.face";
        radiusRatio = 1;
        animationSpeed = 1;
        lockOnSuspend = true;
        enableShadows = true;
        telemetryEnabled = false;
      };

      bar = {
        position = "top";
        density = "default";
        floating = false;
        backgroundOpacity = 0.93;
      };

      wallpaper = {
        enabled = true;
        directory = "/home/sven/Pictures/Wallpapers";
        automationEnabled = true;
        wallpaperChangeMode = "random";
        randomIntervalSec = 10;
        transitionDuration = 1500;
        fillMode = "crop";
      };

      dock = {
        enabled = true;
        position = "bottom";
        displayMode = "auto_hide";
        size = 1;
      };

      notifications = {
        enabled = true;
        location = "top_right";
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
      };

      idle = {
        enabled = true;
        screenOffTimeout = 600;
        lockTimeout = 660;
        suspendTimeout = 1800;
      };
    };
  };
}
