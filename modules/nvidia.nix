{ config, lib, pkgs, inputs, ... }:
{
  options.modules.nvidia.enable = lib.mkEnableOption "nvidia";

  imports = [
    inputs.nixos-hardware.nixosModules.dell-xps-15-9510-nvidia
  ];

  config = lib.mkIf config.modules.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics = {
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
        sync.enable    = true;
        offload.enable = false;       
        };
    };

    environment.sessionVariables = {
      MOZ_DISABLE_RDD_SANDBOX   = "1";
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
