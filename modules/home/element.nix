{ config, lib, pkgs, ... }:
{
  options.modules.element.enable = lib.mkEnableOption "element";
  config = lib.mkIf config.modules.element.enable {
    xdg.desktopEntries.element-desktop = {
      name = "Element";
      exec = "element-desktop --password-store=gnome-libsecret %U";
      icon = "element";
      categories = [ "Network" "InstantMessaging" ];
    };
  };
}
