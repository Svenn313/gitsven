{ pkgs, ... }:
{
  programs.noctalia.settings = builtins.fromTOML (builtins.readFile ./noctalia/noctalia-config.toml);

  xdg.configFile."noctalia/palettes/svenGruvboxPalette.json".source = ./noctalia/noctalia-palette.json;
}
