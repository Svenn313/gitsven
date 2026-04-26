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
      background_opacity         = "0.7";
      #enable_background_blur     = "yes";
      #background_blur            = 1;
      dynamic_background_opacity = "yes";

      # Tabs
      tab_bar_edge          = "bottom";
      tab_bar_margin_height = "0.0 4.0";
      tab_bar_style         = "slant";
      tab_bar_min_tabs      = 2;
      tab_title_template    = "{activity_symbol} {index} {tab.active_exe}";

      # Colors
      foreground           = "#CDD6F4";
      background           = "#11111B";
      selection_foreground = "#11111B";
      selection_background = "#F5E0DC";

      cursor           = "#F5E0DC";
      cursor_text_color = "#11111B";
      url_color        = "#F5E0DC";

      active_border_color   = "#B4BEFE";
      inactive_border_color = "#6C7086";
      bell_border_color     = "#F9E2AF";

      wayland_titlebar_color = "system";
      macos_titlebar_color   = "system";

      active_tab_foreground   = "#CDD6F4";
      active_tab_background   = "#11111B";
      inactive_tab_foreground = "#6C7086";
      inactive_tab_background = "#09090e";
      tab_bar_background      = "#09090e";

      mark1_foreground = "#11111B";
      mark1_background = "#B4BEFE";
      mark2_foreground = "#11111B";
      mark2_background = "#CBA6F7";
      mark3_foreground = "#11111B";
      mark3_background = "#74C7EC";

      # 16 colors
      color0  = "#45475A";
      color8  = "#585B70";
      color1  = "#F38BA8";
      color9  = "#F38BA8";
      color2  = "#A6E3A1";
      color10 = "#A6E3A1";
      color3  = "#F9E2AF";
      color11 = "#F9E2AF";
      color4  = "#89B4FA";
      color12 = "#89B4FA";
      color5  = "#F5C2E7";
      color13 = "#F5C2E7";
      color6  = "#94E2D5";
      color14 = "#94E2D5";
      color7  = "#BAC2DE";
      color15 = "#A6ADC8";
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
