{ pkgs, lib, config, ... }: {
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 22;
        output = [ "*" ];
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ ];
        modules-right = [
          "tray"
          "disk"
          "cpu"
          "memory"
          "battery"
          "pulseaudio"
          "clock"
          "idle_inhibitor"
          "custom/wlogout"
        ];

        "hyprland/workspaces" = {
          all-outputs = false;
          show-special = true;
        };

        "hyprland/window" = { separate-outputs = true; };

        "tray" = {
          icon-size = 14;
          spacing = 8;
          show-passive-items = true;
        };

        "disk" = { "format" = "{free}"; };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-bluetooth" = " {icon} {volume}%";
          "format-muted" = "󰝟  {volume}%";
          "format-icons" = { "default" = [ "󰕿 " "󰖀 " "󰕾 " ]; };
          "scroll-step" = 1;
          "on-click" = "pavucontrol";
        };

        "battery" = {
          "format" = "{icon} {capacity}%";
          "format-charging" = "󱐋 {icon} {capacity}%";
          "format-icons" = [ "󰂎" "󱊡" "󱊢" "󱊣" ];
        };

        "clock" = {
          "format" = "  {:L%B %d, %R}";
          "format-alt" = "  {:L%H:%M} ";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          # "locale" = "en_GB";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 2;
            "weeks-pos" = "left";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-left" = "mode";
          };
        };
        "custom/wlogout" = {
          "format" = "⏻";
          "on-click" = "wlogout";
          "tooltip" = false;
        };
        "idle_inhibitor" = { "format" = "󰥔"; };
      };
    };
  };
}
