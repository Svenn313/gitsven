{ config, lib, pkgs, ... }:

{
  options.modules.sddm.enable = lib.mkEnableOption "sddm";

  config = lib.mkIf config.modules.sddm.enable {

    services.displayManager.sddm = {
      enable         = true;
      wayland.enable = true;
      theme          = "noctalia";
      package        = pkgs.libsForQt5.sddm;
      settings.General.InputMethod = "";
    };

    services.xserver.xkb = {
      layout  = "fr";
      variant = "azerty";
    };

    environment.systemPackages = [
      pkgs.libsForQt5.qt5.qtgraphicaleffects
      pkgs.libsForQt5.qt5.qtquickcontrols2
      (pkgs.stdenv.mkDerivation {
        name = "sddm-noctalia-theme";
        src = pkgs.fetchFromGitHub {
          owner  = "mahaveergurjar";
          repo   = "sddm";
          rev    = "noctalia";
          sha256 = "sha256-Qa2/b8P8Pk1qttMEdpKbExiljGmQEoCrm0tENmFaPak=";
        };
        installPhase = ''
          mkdir -p $out/share/sddm/themes/noctalia
          cp -r . $out/share/sddm/themes/noctalia
        '';
      })
    ];
  };
}
