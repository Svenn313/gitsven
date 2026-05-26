{ pkgs, ... }:
{
  programs.noctalia.settings = builtins.fromTOML (builtins.readFile ./noctalia-config.toml);
}
