{ config, pkgs, ... }:

{
  # Move the nvim folder to ~/.config/
  xdg.configFile."nvim".source = ./nvim;
  xdg.configFile."nvim".recursive = true;
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
