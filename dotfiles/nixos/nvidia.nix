{ config, pkgs, ... }:
# This module load the nvidia driver

{
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true; # Mandatory
    powerManagement.enable = false;
    powerManagement.finegrained = false; # Turns off GPU when not in use
    open = false; # open source kernel module
    nvidiaSettings = true; # Enable the Nvidia settings menu, accessible via `nvidia-settings`.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
