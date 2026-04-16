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

    programs.ssh = {
      enable = true;

      matchBlocks = {
        "arch" = {
          host = "arch nixos laptop";
          hostname = "192.168.1.178";
          user = "sven";
          port = 22923;
          identityFile = "~/.ssh/svenKey";
        };

        "laptop-dropbear" = {
          hostname = "192.168.1.178";
          user = "root";
          port = 2222;
          identityFile = "~/.ssh/svenKey";
        };

        "ubuntu" = {
          hostname = "192.168.1.87";
          user = "sven";
          port = 22923;
          identityFile = "~/.ssh/svenKey";
        };
      };
    };
  };
}
