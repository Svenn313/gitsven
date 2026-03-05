{ config, lib, ... }:

{
  options.modules.locale.enable = lib.mkEnableOption "locale";

  config = lib.mkIf config.modules.locale.enable {
    time.timeZone      = "Europe/Paris";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_TIME = "fr_FR.UTF-8";
    };
    console.keyMap = "fr";
  };
}
