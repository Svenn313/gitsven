{ pkgs, ... }:
{
  programs.noctalia.settings = builtins.fromTOML (builtins.readFile ./noctalia-config.toml);

  xdg.configFile."noctalia/palettes/svenGruvboxPalette.json".source = ./noctalia-palette.json;
}
