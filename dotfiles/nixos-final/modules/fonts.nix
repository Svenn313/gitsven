{ config, lib, pkgs, ... }:

{
  options.modules.fonts.enable = lib.mkEnableOption "fonts";

  config = lib.mkIf config.modules.fonts.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      noto-fonts-emoji
    ];
  };
}
