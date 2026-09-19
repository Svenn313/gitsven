{ config, pkgs, lib, inputs, ... }:
{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel.settings = {
    general = {
      mod_key   = "Super";
      xwayland  = true;
      autostart = [
        "noctalia"
        "blueman-applet"
        "swaybg -i /home/sven/pictures/wallpapers"
      ];
    };

    input = {
      keyboard = {
        layout  = "fr";
        variant = "azerty";
      };
      touchpad.natural_scroll = true;
      cursor = {
        theme = "Bibata-Modern-Classic";
        size  = 24;
      };
    };

    layout = {
      gap = 7;
      scrolling.default_width_fraction = 0.5;
    };

    appearance = {
      border_width   = 2;
      corner_radius  = 5;
      shadow.enabled = true;
    };

    colors = {
      shadow = "#1a1a1aee";
      border = {
        focused   = "#fabd2fff";
        unfocused = "#00000000";
      };
    };

    animation = {
      windows_in.curve = "spring:0.8,400";
      workspaces.curve = "spring:0.8,400";
    };

    window_rule = [
      { blur = true; blur_optimized = true; }
      { match.app_id = "^com\\.mitchellh\\.ghostty$"; opacity = 0.85; }
      { match.app_id = "^org\\.kde\\.dolphin$"; opacity = 0.95; }
    ];

    layer_rule = [
      {
        match.namespace   = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$";
        blur              = true;
        blur_ignore_alpha = 0.5;
        blur_optimized    = false;
      }
    ];

    keybinds = {
      "Mod+A" = "spawn:ghostty";
      "Mod+F" = "spawn:firefox";
      "Mod+T" = "spawn:element-desktop";
      "Mod+E" = "spawn:dolphin";
      "Mod+L" = "spawn:noctalia msg session lock";
      "Mod+Space" = "spawn:noctalia msg panel-toggle launcher";
      "Mod+P" = "spawn:noctalia msg panel-toggle session";
      "Mod+O" = "spawn:noctalia msg panel-toggle control-center";

      "Mod+Q" = "window-close";
      "Mod+V" = "window-toggle-floating";
      "Mod+R" = "window-cycle-width";
      "Mod+M" = "window-toggle-maximize";

      "Mod+Left"  = "window-focus-left";
      "Mod+Right" = "window-focus-right";
      "Mod+Up"    = "window-focus-up";
      "Mod+Down"  = "window-focus-down";

      "Mod+Shift+Left"  = "column-move-left";
      "Mod+Shift+Right" = "column-move-right";
      "Mod+Shift+Up"    = "window-move-up";
      "Mod+Shift+Down"  = "window-move-down";

      "Mod+Ctrl+Left"  = "window-modify-width:-0.1";
      "Mod+Ctrl+Right" = "window-modify-width:0.1";
      "Mod+Ctrl+Up"    = "window-modify-height:-0.1";
      "Mod+Ctrl+Down"  = "window-modify-height:0.1";

      "Mod+ampersand"  = "workspace-switch:1";
      "Mod+eacute"     = "workspace-switch:2";
      "Mod+quotedbl"   = "workspace-switch:3";
      "Mod+apostrophe" = "workspace-switch:4";
      "Mod+parenleft"  = "workspace-switch:5";
      "Mod+minus"      = "workspace-switch:6";
      "Mod+egrave"     = "workspace-switch:7";
      "Mod+underscore" = "workspace-switch:8";
      "Mod+ccedilla"   = "workspace-switch:9";

      "Mod+Shift+ampersand"  = "window-move-to-workspace:1";
      "Mod+Shift+eacute"     = "window-move-to-workspace:2";
      "Mod+Shift+quotedbl"   = "window-move-to-workspace:3";
      "Mod+Shift+apostrophe" = "window-move-to-workspace:4";
      "Mod+Shift+parenleft"  = "window-move-to-workspace:5";
      "Mod+Shift+minus"      = "window-move-to-workspace:6";
      "Mod+Shift+egrave"     = "window-move-to-workspace:7";
      "Mod+Shift+underscore" = "window-move-to-workspace:8";
      "Mod+Shift+ccedilla"   = "window-move-to-workspace:9";

      "XF86AudioMute"         = { action = "spawn:noctalia msg volume-mute";     allow_when_locked = true; };
      "XF86AudioRaiseVolume"  = { action = "spawn:noctalia msg volume-up";       allow_when_locked = true; };
      "XF86AudioLowerVolume"  = { action = "spawn:noctalia msg volume-down";     allow_when_locked = true; };
      "XF86MonBrightnessUp"   = { action = "spawn:noctalia msg brightness-up";   allow_when_locked = true; };
      "XF86MonBrightnessDown" = { action = "spawn:noctalia msg brightness-down"; allow_when_locked = true; };

      "Print" = "spawn:grim ~/pictures/$(date +%Y-%m-%d_%H-%M-%S).png";
    };
  }; 
}
