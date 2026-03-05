{ config, lib, pkgs, ... }:
{
  options.modules.sddm.enable = lib.mkEnableOption "sddm";
  config = lib.mkIf config.modules.sddm.enable {
    services.displayManager.sddm = {
      enable         = true;
      wayland.enable = true;
      theme          = "sddm-astronaut-theme";
      settings.General.InputMethod = "";
      extraPackages = [
        pkgs.kdePackages.qtmultimedia
        (pkgs.sddm-astronaut.override { embeddedTheme = "black_hole"; })
      ];
    };
    services.xserver.xkb = {
      layout  = "fr";
      variant = "azerty";
    };
    environment.systemPackages = [
      (pkgs.sddm-astronaut.override { embeddedTheme = "black_hole"; })
    ];
  };
}
