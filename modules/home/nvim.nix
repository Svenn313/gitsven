{ config, pkgs, ... }:

{
  programs.neovim = {
    defaultEditor = true;
  };

  home.file = {
    ".config/nvim/init.lua".source           = ./nvim/init.lua;
    ".config/nvim/lua/plugins.lua".source    = ./nvim/plugins.lua;
  };
}
