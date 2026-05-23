{ config, pkgs, noctalia-shell, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nvidia.nix
    ../../modules/hyprland-system.nix
    ../../modules/niri-system.nix
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
  # TOGGLES — enable/disable here
  # =========================================
  modules = {
    nvidia.enable     = true;
    hyprland.enable   = true;
    niri.enable       = true;
    docker.enable     = true;
    ssh.enable        = true;
    audio.enable      = true;
    bluetooth.enable  = true;
    networking.enable = true;
    fonts.enable      = true;
    locale.enable     = true;
    sddm.enable       = true;
  };

  programs.zsh.enable   = true;
  services.upower.enable = true;
  services.fwupd.enable = true;
  services.gnome.gnome-keyring.enable = true; # Electron apps need a system keyring
  security.pam.services.sddm.enableGnomeKeyring = true;

  # =========================================
  # BOOT
  # =========================================
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable           = true;
  security.tpm2.enable                 = true;
  security.tpm2.pkcs11.enable          = true;
  boot.kernelParams = [
    "acpi_rev_override=1"
    "pci=realloc"
    "pci=assign-busses"
    "pcie_aspm=off"
  ];

  # =========================================
  # NIX
  # =========================================
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates     = "weekly";
    options   = "--delete-older-than 7d";
  };
  nixpkgs.config.allowUnfree = true;

  # =========================================
  # USER
  # =========================================
  users.users.sven = {
    isNormalUser = true;
    description  = "Sven";
    extraGroups  = [ "docker" "networkmanager" "wheel" ];
    shell        = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJiwxiEmpPQsqwx8zvQXRxx0qpVyxdOcTQvIM+kz+/77"
    ];
  };

  # =========================================
  # PACKAGES
  # =========================================
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    gh
    wakeonlan
    fwupd
    libsecret
  ];
  
  # =========================================
  # SYSTEM
  # =========================================
  system.stateVersion = "25.11";
}
