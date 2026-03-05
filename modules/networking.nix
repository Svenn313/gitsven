{ config, lib, ... }:

{
  options.modules.networking.enable = lib.mkEnableOption "networking";

  config = lib.mkIf config.modules.networking.enable {
    networking = {
      hostName = "laptop";
      networkmanager = {
        enable         = true;
        wifi.powersave = false;
      };
      firewall.allowedUDPPorts = [ 9 ];
    };
  };
}
