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
        predefinedScheme = "Gruvbox";
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
        density = "comfortable";
        floating = true;
        backgroundOpacity = 0.85;
        marginVertical = 6;
        marginHorizontal = 8;
        widgets = {
          left = [
            { id = "Launcher"; }
            { id = "Clock"; }
            { id = "SystemMonitor";
              compactMode = false;
              showCpuUsage = true;
              showCpuTemp = false;
              showMemoryUsage = true;
              showMemoryAsPercent = true;
              showNetworkStats = true;
              showDiskUsage = true;
              showDiskUsageAsPercent = true;
            }
            { id = "ActiveWindow"; }
          ];
          center = [
            { id = "Workspace"; }
          ];
          right = [
            { id = "Tray"; }
            { id = "NotificationHistory"; }
            { id = "Battery"; displayMode = "graphic"; }
            { id = "Volume"; }
            { id = "Brightness"; }
            { id = "ControlCenter"; }
          ];
        };
      };

      wallpaper = {
        enabled = true;
        directory = "/home/sven/pictures/wallpapers";
        automationEnabled = true;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
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

    colors = {
      mSurface        = "#282828";
      mSurfaceVariant = "#3c3836";
      mPrimary        = "#E4C680";
      mSecondary      = "#a08840";
      mTertiary       = "#5a7a5c";
      mError          = "#8c4a4a";
      mHover          = "#c4a85e";
      mOnPrimary      = "#1d2021";
      mOnSecondary    = "#1d2021";
      mOnTertiary     = "#1d2021";
      mOnSurface        = "#ebdbb2";
      mOnSurfaceVariant = "#bdae93";
      mOnError        = "#1d2021";
      mOnHover        = "#1d2021";
      mOutline        = "#504945";
      mShadow         = "#1d2021";
    };
  };
}
