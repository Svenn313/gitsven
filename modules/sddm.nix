{ config, lib, pkgs, ... }:
{
  options.modules.sddm.enable = lib.mkEnableOption "sddm";
  config = lib.mkIf config.modules.sddm.enable {
    services.displayManager.sddm = {
      enable         = true;
      wayland.enable = true;
      theme          = "${pkgs.sddm-astronaut.override {
        embeddedTheme = "black_hole";
        themeConfig = {
          FormBackgroundColor              = "#282828";
          BackgroundColor                  = "#E4C680";
          LoginFieldBackgroundColor        = "#3c3836";
          PasswordFieldBackgroundColor     = "#3c3836";
          LoginFieldTextColor              = "#ebdbb2";
          PasswordFieldTextColor           = "#ebdbb2";
          HeaderTextColor                  = "#bdae93";
          DateTextColor                    = "#bdae93";
          TimeTextColor                    = "#E4C680";
          LoginButtonBackgroundColor       = "#E4C680";
          LoginButtonTextColor             = "#1d2021";
          SystemButtonsIconsColor          = "#bdae93";
          HighlightBackgroundColor         = "#E4C680";
          HighlightTextColor               = "#1d2021";
          DropdownBackgroundColor          = "#282828";
          DropdownSelectedBackgroundColor  = "#E4C680";
          DropdownTextColor                = "#ebdbb2";
          PlaceholderTextColor             = "#504945";
          UserIconColor                    = "#E4C680";
          PasswordIconColor                = "#E4C680";
          SessionButtonTextColor           = "#bdae93";
          HoverUserIconColor               = "#c4a85e";
          HoverPasswordIconColor           = "#c4a85e";
          HoverSystemButtonsIconsColor     = "#c4a85e";
          HoverSessionButtonTextColor      = "#c4a85e";
        };
      }}/share/sddm/themes/sddm-astronaut-theme";
      settings.General.InputMethod = "";
      settings.General.DefaultSession = "niri";
      extraPackages = [ pkgs.kdePackages.qtmultimedia ];
    };
    services.xserver.xkb = {
      layout  = "fr";
      variant = "azerty";
    };
    environment.pathsToLink = [ "/share/sddm/themes" ];
  };
}
