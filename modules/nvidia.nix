{ config, lib, pkgs, ... }:
{
  options.modules.nvidia.enable = lib.mkEnableOption "nvidia";
  config = lib.mkIf config.modules.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics = {
      enable      = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };

    hardware.nvidia = {
      modesetting.enable          = true;
      powerManagement.enable      = false;
      powerManagement.finegrained = false;
      open                        = false;
      nvidiaSettings              = true;
      package                     = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        sync.enable = true;
        intelBusId  = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME         = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS   = "1";
      NVD_BACKEND               = "direct";
      GBM_BACKEND               = "nvidia-drm";
    };

    environment.systemPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };
}
