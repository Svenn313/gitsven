{ config, ... }:
{
  programs.ssh = {
    enableDefaultConfig = false;

    settings = {
      "*" = {};

      "arch nixos laptop" = {
        HostName = "192.168.1.178";
        User = "sven";
        Port = 22923;
        IdentityFile = "~/.ssh/svenKey";
      };

      "laptop-dropbear" = {
        HostName = "192.168.1.178";
        User = "root";
        Port = 2222;
        IdentityFile = "~/.ssh/svenKey";
      };

      "ubuntu" = {
        HostName = "192.168.1.87";
        User = "sven";
        Port = 22923;
        IdentityFile = "~/.ssh/svenKey";
      };
    };

    # Includes hosts with sensitive info (e.g. public IPs) kept out of version control
    extraConfig = "Include ~/.ssh/config.local";
  };
}
