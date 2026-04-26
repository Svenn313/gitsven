{ config, pkgs, inputs, ... }:
{
  programs.niri = {
    settings = {
      input.keyboard.xkb.layout = "fr";
      input.keyboard.xkb.variant = "azerty";

      input.touchpad = {
        natural-scroll = true;
      };

      cursor = {
        theme = "Bibata-Modern-Classic";
        size  = 24;
      };

      outputs."*".scale = 1.0;

      layout = {
        gaps = 7;
        border = {
          enable = true;
          width  = 2;
          active.color   = "#9a00d5";
          inactive.color = "#11111b";
        };
        shadow = {
          enable = true;
          color  = "#1a1a1aee";
        };
      };

      animations = {
        window-open.spring = {
          damping-ratio = 0.8;
          stiffness     = 400;
          epsilon       = 0.0001;
        };
        workspace-switch.spring = {
          damping-ratio = 0.8;
          stiffness     = 400;
          epsilon       = 0.0001;
        };
      };

      spawn-at-startup = [
        { command = [ "noctalia-shell" ]; }
        { command = [ "blueman-applet" ]; }
        { command = [ "xwayland-satellite" ]; }
        { command = [ "swaybg" "-i" "/home/sven/pictures/wallpapers" ]; }
      ];

      binds = with config.lib.niri.actions; {
        "Mod+A".action        = spawn "kitty";
        "Mod+F".action        = spawn "firefox";
        "Mod+T".action        = spawn "element-desktop";
        "Mod+E".action        = spawn "dolphin";
        "Mod+L".action        = spawn "sh" "-c" "noctalia-shell ipc call lockScreen lock";
        "Mod+Space".action    = spawn "sh" "-c" "noctalia-shell ipc call launcher toggle";
        "Mod+P".action        = spawn "sh" "-c" "noctalia-shell ipc call sessionMenu toggle";
        "Mod+O".action        = spawn "sh" "-c" "noctalia-shell ipc call controlCenter toggle";

        "Mod+Q".action        = close-window;
        "Mod+V".action        = toggle-window-floating;
        "Mod+R".action        = switch-preset-column-width;
        "Mod+M".action        = maximize-column;

        "Mod+Left".action     = focus-column-left;
        "Mod+Right".action    = focus-column-right;
        "Mod+Up".action       = focus-window-up;
        "Mod+Down".action     = focus-window-down;

        "Mod+Shift+Left".action  = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Up".action    = move-window-up;
        "Mod+Shift+Down".action  = move-window-down;

        "Mod+Ctrl+Left".action   = set-column-width "-10%";
        "Mod+Ctrl+Right".action  = set-column-width "+10%";
        "Mod+Ctrl+Up".action     = set-window-height "-10%";
        "Mod+Ctrl+Down".action   = set-window-height "+10%";

        "Mod+ampersand".action.focus-workspace  = [ 1 ];
        "Mod+eacute".action.focus-workspace     = [ 2 ];
        "Mod+quotedbl".action.focus-workspace   = [ 3 ];
        "Mod+apostrophe".action.focus-workspace = [ 4 ];
        "Mod+parenleft".action.focus-workspace  = [ 5 ];
        "Mod+minus".action.focus-workspace      = [ 6 ];
        "Mod+egrave".action.focus-workspace     = [ 7 ];
        "Mod+underscore".action.focus-workspace = [ 8 ];
        "Mod+ccedilla".action.focus-workspace   = [ 9 ];

        "Mod+Shift+ampersand".action.move-window-to-workspace  = [ 1 ];
        "Mod+Shift+eacute".action.move-window-to-workspace     = [ 2 ];
        "Mod+Shift+quotedbl".action.move-window-to-workspace   = [ 3 ];
        "Mod+Shift+apostrophe".action.move-window-to-workspace = [ 4 ];
        "Mod+Shift+parenleft".action.move-window-to-workspace  = [ 5 ];
        "Mod+Shift+minus".action.move-window-to-workspace      = [ 6 ];
        "Mod+Shift+egrave".action.move-window-to-workspace     = [ 7 ];
        "Mod+Shift+underscore".action.move-window-to-workspace = [ 8 ];
        "Mod+Shift+ccedilla".action.move-window-to-workspace   = [ 9 ];

        "XF86AudioMute".action         = spawn "sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioRaiseVolume".action  = spawn "sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume".action  = spawn "sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86MonBrightnessUp".action   = spawn "sh" "-c" "brightnessctl set 5%+";
        "XF86MonBrightnessDown".action = spawn "sh" "-c" "brightnessctl set 5%-";

        "Print".action = spawn "sh" "-c" "grim ~/pictures/$(date +%Y-%m-%d_%H-%M-%S).png";
      };

      window-rules = [
        {
          matches = [{ app-id = ".*"; }];
          default-column-width.proportion = 0.5;
        }
      ];
    };
  };
}
