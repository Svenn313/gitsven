{ config, pkgs, ... }:

{
  programs.kitty = {
    font = {
      name = "MesloLGS NF Regular";
      size = 15.0;
    };

    settings = {
      bold_font        = "MesloLGS NF Bold";
      italic_font      = "MesloLGS NF Italic";
      bold_italic_font = "MesloLGS NF Bold Italic";
      clipboard_control = "write-clipboard write-primary read-clipboard-ask read-primary-ask";

     # Cursor
      shell_integration      = "no-cursor";
      cursor_shape           = "block";
      cursor_blink_interval  = 0;

      # Background
      background_opacity = "1";

      # Tabs
      tab_bar_edge          = "bottom";
      tab_bar_margin_height = "0.0 4.0";
      tab_bar_style         = "slant";
      tab_bar_min_tabs      = 2;
      tab_title_template    = "{activity_symbol} {index} {tab.active_exe}";

      # Colors — Gruvbox
      foreground           = "#ebdbb2";
      background           = "#282828";
      selection_foreground = "#ebdbb2";
      selection_background = "#504945";

      cursor            = "#E4C680";
      cursor_text_color = "#1d2021";
      url_color         = "#83a598";

      active_border_color   = "#E4C680";
      inactive_border_color = "#504945";
      bell_border_color     = "#a08840";

      wayland_titlebar_color = "system";
      macos_titlebar_color   = "system";

      active_tab_foreground   = "#1d2021";
      active_tab_background   = "#E4C680";
      inactive_tab_foreground = "#bdae93";
      inactive_tab_background = "#3c3836";
      tab_bar_background      = "#1d2021";

      mark1_foreground = "#1d2021";
      mark1_background = "#E4C680";
      mark2_foreground = "#1d2021";
      mark2_background = "#a08840";
      mark3_foreground = "#1d2021";
      mark3_background = "#5a7a5c";

      # 16 colors
      color0  = "#282828";
      color8  = "#504945";
      color1  = "#8c4a4a";
      color9  = "#9d5c5c";
      color2  = "#5a7a5c";
      color10 = "#6b8f6b";
      color3  = "#d4a96a";
      color11 = "#E4C680";
      color4  = "#458588";
      color12 = "#83a598";
      color5  = "#b16286";
      color13 = "#d3869b";
      color6  = "#8ec07c";
      color14 = "#8ec07c";
      color7  = "#bdae93";
      color15 = "#ebdbb2";
    };

    keybindings = {
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
    };
    
    extraConfig = ''
      modify_font underline_position +3
      modify_font underline_thickness 150%
    '';
  };
}
