# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "svenNixOS"; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking
 
  # Auto garbage collect
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.optimise.automatic = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  hardware.bluetooth = {
  enable = true;
  };

  hardware.graphics = {
  enable = true;
  enable32Bit = true;
  };

  # Environment Variables 
  environment.variables = {
    XKB_DEFAULT_LAYOUT = "fr";
    XKB_DEFAULT_VARIANT = "";
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Hyprland 
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  xdg.portal = { enable = true; };
  programs.hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Greet and Regreet  
  services.greetd = {
    enable = true;
    vt = 1;
  };
  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = /home/sven/Pictures/wallpaper.jpg;
        fit = "Fill";
      };
      GTK = {
        application_prefer_dark_theme = true;
      };
    };
    cursorTheme.name = "Orchis";
    font.name = "Hack";
    iconTheme.name = "Orchis";
    theme.name = "Orchis";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.sven = {
    isNormalUser = true;
    description = "Sven";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJiwxiEmpPQsqwx8zvQXRxx0qpVyxdOcTQvIM+kz+/77"
    ];
  };

  # Enable Zsh
  programs.zsh.enable = true;
 
  # Install Docker
  virtualisation.docker.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22923 ];
    settings = {
      PasswordAuthentication = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	vim
	wget
	curl
	home-manager
	git
  ];

  # List services that you want to enable:

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
