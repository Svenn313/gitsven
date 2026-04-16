{ config, lib, ... }:
{
  options.modules.ssh.enable = lib.mkEnableOption "ssh";

  config = lib.mkIf config.modules.ssh.enable {

    services.openssh = {
      enable = true;
      ports  = [ 22923 ];
      settings = {
        PasswordAuthentication       = false;
        X11Forwarding                = false;
        PermitRootLogin              = "no";
        KbdInteractiveAuthentication = false;
      };
    };

    environment.etc."ssh/ssh_config.d/hosts.conf".text = ''
      Host arch nixos laptop
        HostName 192.168.1.178
        User sven
        Port 22923
        IdentityFile ~/.ssh/svenKey

      Host laptop-dropbear
        HostName 192.168.1.178
        User root
        Port 2222
        IdentityFile ~/.ssh/svenKey

      Host ubuntu
        HostName 192.168.1.87
        User sven
        Port 22923
        IdentityFile ~/.ssh/svenKey
    '';
  };
}
