{ config, lib, pkgs, ... }:
{
  options.modules.sddm.enable = lib.mkEnableOption "sddm";
  config = lib.mkIf config.modules.sddm.enable {
    services.displayManager.sddm = {
      enable         = true;
      wayland.enable = true;
      theme          = "${pkgs.sddm-astronaut.override { embeddedTheme = "black_hole"; }}/share/sddm/themes/sddm-astronaut-theme";
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
