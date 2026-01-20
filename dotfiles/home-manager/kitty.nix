{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
      name = "FiraCode Nerd Font";
      size = 13;
    };
    settings = {
      # Apparence
      background_opacity = 0.95;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      enable_audio_bell = "no";

      # Ergonomie
      scrollback_lines = 10000;
      confirm_os_window_close = 0;
    };
  };
}

