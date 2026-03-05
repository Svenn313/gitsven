{ config, lib, pkgs, ... }:

{
  options.modules.greeter.enable = lib.mkEnableOption "greeter";

  config = lib.mkIf config.modules.greeter.enable {

    services.greetd.enable = true;

    programs.regreet = {
      enable = true;
      settings = {
        GTK = {
          application_prefer_dark_theme = true;
        };
      };
    };

    services.xserver.xkb = {
      layout  = "fr";
      variant = "azerty";
    };
  };
}
