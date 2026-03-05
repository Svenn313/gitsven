{ config, lib, pkgs, ... }:

{
  options.modules.sddm.enable = lib.mkEnableOption "sddm";

  config = lib.mkIf config.modules.sddm.enable {

    services.displayManager.sddm = {
      enable         = true;
      wayland.enable = true;
      settings.General.InputMethod = "";
      theme = "noctalia";
    };

    environment.systemPackages = [
      (pkgs.stdenv.mkDerivation {
        name = "sddm-noctalia-theme";
        src = pkgs.fetchFromGitHub {
          owner  = "mahaveergurjar";
          repo   = "sddm";
          rev    = "noctalia";
          sha256 = pkgs.lib.fakeHash;
        };
        installPhase = ''
          mkdir -p $out/share/sddm/themes/noctalia
          cp -r . $out/share/sddm/themes/noctalia
        '';
      })
    ];
  };
}
