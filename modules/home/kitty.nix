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

      # Colors — Tokyo Night
      foreground           = "#c0caf5";
      background           = "#1a1b26";
      selection_foreground = "#c0caf5";
      selection_background = "#283457";

      cursor            = "#c0caf5";
      cursor_text_color = "#1a1b26";
      url_color         = "#73daca";

      active_border_color   = "#7aa2f7";
      inactive_border_color = "#3b4261";
      bell_border_color     = "#ff9e64";

      wayland_titlebar_color = "system";
      macos_titlebar_color   = "system";

      active_tab_foreground   = "#1a1b26";
      active_tab_background   = "#7aa2f7";
      inactive_tab_foreground = "#545c7e";
      inactive_tab_background = "#16161e";
      tab_bar_background      = "#101014";

      mark1_foreground = "#1a1b26";
      mark1_background = "#7aa2f7";
      mark2_foreground = "#1a1b26";
      mark2_background = "#bb9af7";
      mark3_foreground = "#1a1b26";
      mark3_background = "#73daca";

      # 16 colors
      color0  = "#15161e";
      color8  = "#414868";
      color1  = "#f7768e";
      color9  = "#f7768e";
      color2  = "#9ece6a";
      color10 = "#9ece6a";
      color3  = "#e0af68";
      color11 = "#e0af68";
      color4  = "#7aa2f7";
      color12 = "#7aa2f7";
      color5  = "#bb9af7";
      color13 = "#bb9af7";
      color6  = "#7dcfff";
      color14 = "#7dcfff";
      color7  = "#a9b1d6";
      color15 = "#c0caf5";
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
