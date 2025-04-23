{ config, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      source = "$HOME/.cache/wal/colors-hyprland.conf";

      background = [
        {
          monitor = "eDP-1";
          path = "$HOME/Pictures/wallpaper.jpg";
          blur_size = 4;
          blur_passes = 3;
          noise = 0.0117;
          contrast = 1.3;
          brightness = 0.8;
          vibrancy = 0.21;
          vibrancy_darkness = 0.0;
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%H\") </big></b>\"";
          color = "$color6";
          font_size = 112;
          font_family = "Geist Mono 10";
          shadow_passes = 3;
          shadow_size = 4;
          position = "0, 220";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<b><big> $(date +\"%M\") </big></b>\"";
          color = "$color6";
          font_size = 112;
          font_family = "Geist Mono 10";
          shadow_passes = 3;
          shadow_size = 4;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:18000000] echo \"<b><big> $(date +'%A') </big></b>\"";
          color = "$color7";
          font_size = 22;
          font_family = "JetBrainsMono Nerd Font 10";
          position = "0, 20";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:18000000] echo \"<b> $(date +'%d %b') </b>\"";
          color = "$color7";
          font_size = 18;
          font_family = "JetBrainsMono Nerd Font 10";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:18000000] echo \"<b>Feels like<big> $(curl -s 'wttr.in?format=%t' | tr -d '+') </big></b>\"";
          color = "$color7";
          font_size = 18;
          font_family = "Geist Mono 10";
          position = "0, 40";
          halign = "center";
          valign = "bottom";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 3;
          dots_size = 0.26;
          dots_spacing = 0.64;
          dots_center = true;
          dots_rouding = -1;
          rounding = 22;
          outer_color = "$color0";
          inner_color = "$color0";
          font_color = "$color6";
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>";
          position = "0, 120";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}

