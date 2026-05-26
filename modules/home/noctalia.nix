{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  config = lib.mkIf (config.desktop.enable && config.desktop.tiling.enable) {
    programs.noctalia = {
      enable = true;

      settings = builtins.fromTOML (builtins.readFile ./noctalia-config.toml);
    };
  };
}
