{ config, pkgs, ... }:

{
  programs.ghostty = {
    settings = {
      window-decoration    = false;
      background           = "#282828";
      foreground           = "#f2f0ec";
      cursor-color         = "#E4C680";
      selection-background = "#504945";
      selection-foreground = "#f2f0ec";

      palette = [
        "0=#282828"
        "1=#cc241d"
        "2=#98971a"
        "3=#d79921"
        "4=#458588"
        "5=#b16286"
        "6=#689d6a"
        "7=#a89984"
        "8=#928374"
        "9=#fb4934"
        "10=#b8bb26"
        "11=#fabd2f"
        "12=#83a598"
        "13=#d3869b"
        "14=#8ec07c"
        "15=#ebdbb2"
      ];
    };
  };
}
