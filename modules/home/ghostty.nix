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
        "1=#8c4a4a"
        "2=#5a7a5c"
        "3=#d4a96a"
        "4=#458588"
        "5=#b16286"
        "6=#8ec07c"
        "7=#d4d0c8"
        "8=#504945"
        "9=#9d5c5c"
        "10=#6b8f6b"
        "11=#E4C680"
        "12=#83a598"
        "13=#d3869b"
        "14=#8ec07c"
        "15=#f2f0ec"
      ];
    };
  };
}
