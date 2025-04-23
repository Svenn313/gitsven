{ pkgs, ... }:

let
  # Fetch stylix module from GitHub
  stylix = pkgs.fetchFromGitHub {
    owner = "danth";
    repo = "stylix";
    rev = "f46d58be39a7822a88f29b1650ec14c961c81414";
    sha256 = "PM5GUWR6O4b4cETjkbtLdzGI9IUOM/sP+AUz7rf6lHo=";  # Correct hash
  };
in
{
  # Import the stylix home-manager module
  imports = [ "${stylix}/home-manager-module.nix" ];

  # Stylix configuration
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    targets = {
      neovim.enable = false;
      waybar.enable = false;
      wofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
    };

    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
      };
      monospace = {
        name = "Hack Nerd Font";
      };
      sansSerif = {
        name = "Hack Nerd Font";
      };
      serif = {
        name = "Hack Nerd Font";
      };
      sizes = {
        terminal = 13;
        applications = 11;
      };
    };

    iconTheme = {
      enable = true;
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
}

