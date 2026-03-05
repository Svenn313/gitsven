{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprland.conf".text = ''
    ################
    ### MONITORS ###
    ################

    monitor=,preferred,auto,1

    ################
    ### AUTOEXEC ###
    ################

    exec-once = qs -c noctalia-shell
    exec-once = blueman-applet

    ###################
    ### MY PROGRAMS ###
    ###################

    $terminal    = kitty
    $fileManager = dolphin
    $menu        = hyprlauncher

    #############################
    ### ENVIRONMENT VARIABLES ###
    #############################

    env = XCURSOR_SIZE,24
    env = HYPRCURSOR_SIZE,24

    #####################
    ### LOOK AND FEEL ###
    #####################

    general {
      gaps_in  = 3
      gaps_out = 7
      border_size = 2
      col.active_border   = rgb(9a00d5)
      col.inactive_border = rgb(11111b)
    }

    decoration {
      rounding       = 5
      rounding_power = 2

      shadow {
        enabled      = true
        range        = 4
        render_power = 3
        color        = rgba(1a1a1aee)
      }

      blur {
        enabled  = true
        size     = 3
        passes   = 3
        vibrancy = 0.1696
      }
    }

    animations {
      enabled = yes
      bezier  = myBezier, 0.16, 1, 0.3, 1

      animation = windows,    1, 5,  myBezier
      animation = windowsOut, 1, 5,  myBezier, popin 80%
      animation = border,     1, 10, myBezier
      animation = fade,       1, 10, myBezier
      animation = workspaces, 1, 10, myBezier
    }

    layerrule {
      name            = noctalia
      match:namespace = noctalia-background-.*$
      ignore_alpha    = 0.5
      blur            = true
      blur_popups     = true
    }

    #############
    ### INPUT ###
    #############

    input {
      kb_layout    = fr
      follow_mouse = 1
      sensitivity  = 0

      touchpad {
        natural_scroll = yes
      }
    }

    ################
    ### GESTURES ###
    ################

    gesture = 3, horizontal, workspace

    ###################
    ### KEYBINDINGS ###
    ###################

    $mainMod = SUPER
    $ipc     = qs -c noctalia-shell ipc call

    bind  = $mainMod, A, exec, kitty
    bind  = $mainMod, F, exec, firefox
    bind  = $mainMod, S, exec, signal-desktop
    bind  = $mainMod, T, exec, Telegram
    bind  = $mainMod, L, exec, $ipc lockScreen lock
    bind  = $mainMod, E, exec, $fileManager
    bind  = $mainMod, Q, killactive
    bind  = $mainMod, SPACE, exec, $ipc launcher toggle
    bind  = $mainMod, P, exec, $ipc sessionMenu toggle
    bind  = $mainMod, O, exec, $ipc controlCenter toggle
    bind  = $mainMod, V, togglefloating,

    bind  = , XF86AudioMute,        exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    binde = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    binde = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

    bind = , xf86monbrightnessup,   exec, brightnessctl set 5%+
    bind = , xf86monbrightnessdown, exec, brightnessctl set 5%-

    bind = , print,     exec, grim ~/Pictures/$(date ''+%Y-%m-%d-%H:%M:%S'').png
    bind = $mainMod, S, exec, grim ~/Pictures/$(date ''+%Y-%m-%d-%H:%M:%S'').png

    bind = $mainMod, left,  movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up,    movefocus, u
    bind = $mainMod, down,  movefocus, d

    bind = $mainMod, ampersand,  workspace, 1
    bind = $mainMod, eacute,     workspace, 2
    bind = $mainMod, quotedbl,   workspace, 3
    bind = $mainMod, apostrophe, workspace, 4
    bind = $mainMod, parenleft,  workspace, 5
    bind = $mainMod, minus,      workspace, 6
    bind = $mainMod, egrave,     workspace, 7
    bind = $mainMod, underscore, workspace, 8
    bind = $mainMod, ccedilla,   workspace, 9

    bind = $mainMod SHIFT, ampersand,  movetoworkspace, 1
    bind = $mainMod SHIFT, eacute,     movetoworkspace, 2
    bind = $mainMod SHIFT, quotedbl,   movetoworkspace, 3
    bind = $mainMod SHIFT, apostrophe, movetoworkspace, 4
    bind = $mainMod SHIFT, parenleft,  movetoworkspace, 5
    bind = $mainMod SHIFT, minus,      movetoworkspace, 6
    bind = $mainMod SHIFT, egrave,     movetoworkspace, 7
    bind = $mainMod SHIFT, underscore, movetoworkspace, 8
    bind = $mainMod SHIFT, ccedilla,   movetoworkspace, 9

    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    bindd = $mainMod SHIFT, left,  Move window left,  movewindow, l
    bindd = $mainMod SHIFT, right, Move window right, movewindow, r
    bindd = $mainMod SHIFT, up,    Move window up,    movewindow, u
    bindd = $mainMod SHIFT, down,  Move window down,  movewindow, d

    bind = $mainMod SHIFT, right, resizeactive,  10 0
    bind = $mainMod SHIFT, left,  resizeactive, -10 0
    bind = $mainMod SHIFT, up,    resizeactive,  0 -10
    bind = $mainMod SHIFT, down,  resizeactive,  0  10

    ##############################
    ### WINDOWS AND WORKSPACES ###
    ##############################

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
}
