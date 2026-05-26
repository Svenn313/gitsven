{ config, pkgs, inputs, ... }:

{
  programs.noctalia = {
    settings = {
      shell = {
        corner_radius_scale = 1;
        telemetry_enabled   = false;
        avatar_path         = "/home/sven/.face";
        animation.speed     = 1.0;
      };

      theme = {
        mode    = "dark";
        source  = "builtin";
        builtin = "Gruvbox";
      };

      wallpaper = {
        enabled             = true;
        directory           = "/home/sven/pictures/wallpapers";
        fill_mode           = "crop";
        transition_duration = 1500;
        automation = {
          enabled          = true;
          order            = "random";
          interval_minutes = 5;
        };
      };

      bar = {
        main = {
          position           = "top";
          background_opacity = 0.85;
          margin_h           = 8;
          margin_v           = 6;
          start              = [ "launcher" "clock" "system-monitor" "battery" "active-window" ];
          center             = [ "workspaces" ];
          end                = [ "tray" "notifications" "volume" "brightness" "control-center" ];
        };
      };

      dock = {
        enabled   = true;
        position  = "bottom";
        auto_hide = true;
      };

      notification = {
        enable_daemon = true;
        offset_x      = 20;
        offset_y      = 8;
      };

      idle = {
        behavior = {
          lock = {
            timeout = 660;
            command = "noctalia:screen-lock";
            enabled = true;
          };
          "screen-off" = {
            timeout        = 600;
            command        = "noctalia:dpms-off";
            resume_command = "noctalia:dpms-on";
            enabled        = true;
          };
        };
      };
    };
  };
}
