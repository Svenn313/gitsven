{ config, pkgs, ... }:

let
  mainMod = "SUPER";
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [
        ",preferred,auto,1"
        # "eDP-1,disable"
      ];

      exec-once = [
        "waybar"
        "hyprpaper"
        "blueman-applet"
      ];

      misc = {
        disable_hyprland_logo = true;
      };

      input = {
        follow_mouse = 1;
        touchpad.natural_scroll = "yes";
        kb_layout = "fr";
        kb_options = "caps:escape";
      };

      general = {
        gaps_in = 1;
        gaps_out = 2;
        border_size = 1;
        "col.active_border" = "rgba(FFF000aa) rgba(33ccff60)";
        "col.inactive_border" = "rgb(11111b)";
        layout = "master";
      };

      decoration = {
        rounding = 3;
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.16, 1, 0.3, 1";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 5, myBezier, popin 80%"
          "border, 1, 10, myBezier"
          "fade, 1, 10, myBezier"
          "workspaces, 1, 10, myBezier"
        ];
      };

      gestures = {
        workspace_swipe = true;
      };

      windowrule = [
        "float, Wofi"
        "noborder, Wofi"
        "float, title:^(sfml)$"
        "center, title:^(sfml)$"
      ];

      bind = [
        "${mainMod}, o, layoutmsg, orientationnext"
        "${mainMod}, A, exec, kitty"
        "${mainMod}, F, exec, firefox"
        "${mainMod}, T, exec, telegram-desktop"
        "${mainMod}, L, exec, hyprlock"
        "${mainMod}, E, exec, Thunar"
        "${mainMod}, Q, killactive"
        "${mainMod}, SPACE, exec, ${pkgs.wofi}/bin/wofi --show drun"
        "${mainMod}, P, exec, sh $HOME/.config/rofi/bin/powermenu"
        "${mainMod}, V, togglefloating,"
        "${mainMod}, W, exec, pkill -SIGUSR1 '^waybar$'"

        ", xf86audioraisevolume, exec, ${pkgs.pamixer}/bin/pamixer sset Master 1%+;"
        ", xf86audiolowervolume, exec, ${pkgs.pamixer}/bin/pamixer sset Master 1%-;"
        ", xf86monbrightnessup, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%+"
        ", xf86monbrightnessdown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"

        ", print, exec, grim ~/Pictures/$(date '+%Y-%m-%d-%H:%M:%S').png"
        "${mainMod}, S, exec, grim ~/Pictures/$(date '+%Y-%m-%d-%H:%M:%S').png"

        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"

        "${mainMod}, ampersand, workspace, 1"
        "${mainMod}, eacute, workspace, 2"
        "${mainMod}, quotedbl, workspace, 3"
        "${mainMod}, apostrophe, workspace, 4"
        "${mainMod}, parenleft, workspace, 5"
        "${mainMod}, minus, workspace, 6"
        "${mainMod}, egrave, workspace, 7"
        "${mainMod}, underscore, workspace, 8"
        "${mainMod}, ccedilla, workspace, 9"

        "${mainMod} SHIFT, ampersand, movetoworkspace, 1"
        "${mainMod} SHIFT, eacute, movetoworkspace, 2"
        "${mainMod} SHIFT, quotedbl, movetoworkspace, 3"
        "${mainMod} SHIFT, apostrophe, movetoworkspace, 4"
        "${mainMod} SHIFT, parenleft, movetoworkspace, 5"
        "${mainMod} SHIFT, minus, movetoworkspace, 6"
        "${mainMod} SHIFT, egrave, movetoworkspace, 7"
        "${mainMod} SHIFT, underscore, movetoworkspace, 8"
        "${mainMod} SHIFT, ccedilla, movetoworkspace, 9"

        "${mainMod} SHIFT, right, resizeactive, 10 0"
        "${mainMod} SHIFT, left, resizeactive, -10 0"
        "${mainMod} SHIFT, up, resizeactive, 0 -10"
        "${mainMod} SHIFT, down, resizeactive, 0 10"
      ];

      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];
      bindd = [
        "${mainMod} SHIFT, left, Move window left, movewindow, l"
        "${mainMod} SHIFT, right, Move window right, movewindow, r"
        "${mainMod} SHIFT, up, Move window up, movewindow, u"
        "${mainMod} SHIFT, down, Move window down, movewindow, d"
      ];
    };
  };
}
