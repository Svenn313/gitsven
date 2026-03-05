{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = ",preferred,auto,1";

      exec-once = [
        "noctalia-shell"
        "blueman-applet"
        "sleep 3 && noctalia-shell ipc call wallpaper enableAutomation"
      ];

      "$terminal"    = "kitty";
      "$fileManager" = "dolphin";
      "$menu"        = "hyprlauncher";
      "$mainMod"     = "SUPER";
      "$ipc"         = "noctalia-shell ipc call";

      env = [
        "XCURSOR_THEME, Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in     = 3;
        gaps_out    = 7;
        border_size = 2;
        "col.active_border"   = "rgb(9a00d5)";
        "col.inactive_border" = "rgb(11111b)";
      };

      decoration = {
        rounding       = 5;
        rounding_power = 2;
        shadow = {
          enabled      = true;
          range        = 4;
          render_power = 3;
          color        = "rgba(1a1a1aee)";
        };
        blur = {
          enabled  = true;
          size     = 3;
          passes   = 3;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.16, 1, 0.3, 1";
        animation = [
          "windows,    1, 5,  myBezier"
          "windowsOut, 1, 5,  myBezier, popin 80%"
          "border,     1, 10, myBezier"
          "fade,       1, 10, myBezier"
          "workspaces, 1, 10, myBezier"
        ];
      };

      input = {
        kb_layout    = "fr";
        follow_mouse = 1;
        sensitivity  = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      gesture = "3, horizontal, workspace";

      bind = [
        "$mainMod, A, exec, kitty"
        "$mainMod, F, exec, firefox"
        "$mainMod, S, exec, signal-desktop"
        "$mainMod, T, exec, Telegram"
        "$mainMod, L, exec, $ipc lockScreen lock"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, Q, killactive"
        "$mainMod, SPACE, exec, $ipc launcher toggle"
        "$mainMod, P, exec, $ipc sessionMenu toggle"
        "$mainMod, O, exec, $ipc controlCenter toggle"
        "$mainMod, V, togglefloating,"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", xf86monbrightnessup,   exec, brightnessctl set 5%+"
        ", xf86monbrightnessdown, exec, brightnessctl set 5%-"
        ", print, exec, grim ~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png"
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"
        "$mainMod, ampersand,  workspace, 1"
        "$mainMod, eacute,     workspace, 2"
        "$mainMod, quotedbl,   workspace, 3"
        "$mainMod, apostrophe, workspace, 4"
        "$mainMod, parenleft,  workspace, 5"
        "$mainMod, minus,      workspace, 6"
        "$mainMod, egrave,     workspace, 7"
        "$mainMod, underscore, workspace, 8"
        "$mainMod, ccedilla,   workspace, 9"
        "$mainMod SHIFT, ampersand,  movetoworkspace, 1"
        "$mainMod SHIFT, eacute,     movetoworkspace, 2"
        "$mainMod SHIFT, quotedbl,   movetoworkspace, 3"
        "$mainMod SHIFT, apostrophe, movetoworkspace, 4"
        "$mainMod SHIFT, parenleft,  movetoworkspace, 5"
        "$mainMod SHIFT, minus,      movetoworkspace, 6"
        "$mainMod SHIFT, egrave,     movetoworkspace, 7"
        "$mainMod SHIFT, underscore, movetoworkspace, 8"
        "$mainMod SHIFT, ccedilla,   movetoworkspace, 9"
        "$mainMod SHIFT, right, resizeactive,  10 0"
        "$mainMod SHIFT, left,  resizeactive, -10 0"
        "$mainMod SHIFT, up,    resizeactive,  0 -10"
        "$mainMod SHIFT, down,  resizeactive,  0  10"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindd = [
        "$mainMod SHIFT, left,  Move window left,  movewindow, l"
        "$mainMod SHIFT, right, Move window right, movewindow, r"
        "$mainMod SHIFT, up,    Move window up,    movewindow, u"
        "$mainMod SHIFT, down,  Move window down,  movewindow, d"
      ];
    };

    # layerrule et windowrule gardés en extraConfig car nouvelle syntaxe non supportée par HM
    extraConfig = ''
      layerrule {
        name            = noctalia
        match:namespace = noctalia-background-.*$
        ignore_alpha    = 0.5
        blur            = true
        blur_popups     = true
      }

      windowrule {
        name  = suppress-maximize-events
        match:class = .*
        suppress_event = maximize
      }

      windowrule {
        name             = fix-xwayland-drags
        match:class      = ^$
        match:title      = ^$
        match:xwayland   = true
        match:float      = true
        match:fullscreen = false
        match:pin        = false
        no_focus = true
      }

      windowrule {
        name        = move-hyprland-run
        match:class = hyprland-run
        move  = 20 monitor_h-120
        float = yes
      }
    '';
  };
}
