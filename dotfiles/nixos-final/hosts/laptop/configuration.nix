{ config, pkgs, noctalia-shell, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nvidia.nix
    ../../modules/hyprland-system.nix
    ../../modules/docker.nix
    ../../modules/ssh.nix
    ../../modules/audio.nix
    ../../modules/bluetooth.nix
    ../../modules/networking.nix
    ../../modules/fonts.nix
    ../../modules/locale.nix
    ../../modules/sddm.nix
  ];

  # =========================================
  # MODULES TOGGLE — activer/désactiver ici
  # =========================================
  modules = {
    nvidia.enable     = true; # désactivé en VM, activer sur vrai hardware
    hyprland.enable   = true;
    docker.enable     = true;
    ssh.enable        = true;
    audio.enable      = true;
    bluetooth.enable  = true;
    networking.enable = true;
    fonts.enable      = true;
    locale.enable     = true;
  };

  # =========================================
  # SYSTÈME
  # =========================================
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "acpi_rev_override=1"
    "pci=realloc"
    "pci=assign-busses"
    "pcie_aspm=off"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates     = "weekly";
    options   = "--delete-older-than 7d";
  };

  users.users.sven = {
    isNormalUser = true;
    description  = "Sven";
    extraGroups  = [ "docker" "networkmanager" "wheel" ];
    shell        = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJiwxiEmpPQsqwx8zvQXRxx0qpVyxdOcTQvIM+kz+/77"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    wakeonlan
  ];

  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable        = true;
  system.stateVersion        = "25.11";
}
