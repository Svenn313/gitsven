{ config, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

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
}
