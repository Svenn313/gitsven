{ config, lib, pkgs, ... }:

{
  options.modules.greeter.enable = lib.mkEnableOption "greeter";

  config = lib.mkIf config.modules.greeter.enable {
  services.greetd.enable = true;
  programs.regreet = {
    enable = true;
    settings = {
    default_session = {
      command = "Hyprland";
      user    = "sven";
    };
    GTK = {
      application_prefer_dark_theme = true;
      };
    };
  };

  environment.sessionVariables.XKB_DEFAULT_LAYOUT = "fr";
  services.xserver.xkb = {
    layout  = "fr";
    variant = "azerty";
    };
  };
}
