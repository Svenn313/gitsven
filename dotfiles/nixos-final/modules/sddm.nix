{ config, lib, pkgs, ... }:

let
  sddmThemeBase = pkgs.sddm-astronaut.override {
    embeddedTheme = "black_hole";
    themeConfig = {
      Background = "/etc/sddm-wallpaper";
      FullBlur = "false";
      PartialBlur = "true";
      BlurMax = "32";
      Blur = "0.3";
      RoundCorners = "10";
      HourFormat = "HH:mm";
      DateFormat = "dddd d MMMM";
      Locale = "fr_FR";
      FormPosition = "left";
      HaveFormBackground = "true";
      FormBackgroundColor = "#1e1e2e";
      BackgroundColor = "#cba6f7";
      DimBackgroundColor = "#000000";
      DimBackground = "0.3";
      HeaderTextColor = "#cdd6f4";
      DateTextColor = "#cdd6f4";
      TimeTextColor = "#cba6f7";
      LoginFieldBackgroundColor = "#313244";
      PasswordFieldBackgroundColor = "#313244";
      LoginFieldTextColor = "#cdd6f4";
      PasswordFieldTextColor = "#cdd6f4";
      UserIconColor = "#cba6f7";
      PasswordIconColor = "#cba6f7";
      PlaceholderTextColor = "#6c7086";
      WarningColor = "#f38ba8";
      LoginButtonTextColor = "#1e1e2e";
      LoginButtonBackgroundColor = "#cba6f7";
      SystemButtonsIconsColor = "#cdd6f4";
      SessionButtonTextColor = "#cdd6f4";
      DropdownTextColor = "#cdd6f4";
      DropdownSelectedBackgroundColor = "#cba6f7";
      DropdownBackgroundColor = "#181825";
      HighlightTextColor = "#1e1e2e";
      HighlightBackgroundColor = "#cba6f7";
      HighlightBorderColor = "#b4befe";
      HoverUserIconColor = "#b4befe";
      HoverPasswordIconColor = "#b4befe";
      HoverSystemButtonsIconsColor = "#b4befe";
      HoverSessionButtonTextColor = "#b4befe";
    };
  };

  sddmTheme = pkgs.runCommand "sddm-astronaut-custom" {} ''
    cp -r ${sddmThemeBase}/share/sddm/themes/sddm-astronaut-theme $out
    chmod -R +w $out
    sed -i "s|ConfigFile=Themes/black_hole.conf$|ConfigFile=Themes/black_hole.conf.user|" $out/metadata.desktop
  '';

  sddmWallpaperScript = pkgs.writeShellScript "sddm-wallpaper" ''
    WALLPAPER_DIR="/home/sven/Pictures/Wallpapers"
    WALLPAPERS=($(ls "$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp} 2>/dev/null))
    COUNT=''${#WALLPAPERS[@]}
    if [ "$COUNT" -gt 0 ]; then
      RANDOM_INDEX=$((RANDOM % COUNT))
      cp "''${WALLPAPERS[$RANDOM_INDEX]}" /etc/sddm-wallpaper
    fi
  '';
in
{
  options.modules.sddm.enable = lib.mkEnableOption "sddm";
  config = lib.mkIf config.modules.sddm.enable {
    systemd.services.sddm-wallpaper = {
      description = "Set random SDDM wallpaper";
      wantedBy = [ "sddm.service" ];
      before = [ "sddm.service" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${sddmWallpaperScript}";
      };
    };
    services.displayManager.sddm = {
      enable         = true;
      wayland.enable = true;
      theme          = "${sddmTheme}";
      settings.General.InputMethod = "";
      extraPackages = [
        pkgs.kdePackages.qtmultimedia
      ];
    };
    services.xserver.xkb = {
      layout  = "fr";
      variant = "azerty";
    };
    environment.pathsToLink = [ "/share/sddm/themes" ];
  };
}
