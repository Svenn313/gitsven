{ config, lib, ... }:
{
  options.modules.ssh.enable = lib.mkEnableOption "ssh";

  config = lib.mkIf config.modules.ssh.enable {

    services.openssh = {
      enable = true;
      ports = [ 22923 ];
      settings = {
        PasswordAuthentication = false;
        X11Forwarding = false;
        PermitRootLogin = "no";
        KbdInteractiveAuthentication = false;
      };
    };

  };
}
