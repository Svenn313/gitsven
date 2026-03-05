{ config, pkgs, ... }:

{
  programs.neovim = {
    enable        = true;
    defaultEditor = true;
    package       = pkgs.neovim-unwrapped;
    plugins       = [ pkgs.vimPlugins.lazy-nvim ];
  };

  home.file = {
    ".config/nvim/init.lua".source           = ./nvim/init.lua;
    ".config/nvim/lua/plugins.lua".source    = ./nvim/plugins.lua;
  };
}
