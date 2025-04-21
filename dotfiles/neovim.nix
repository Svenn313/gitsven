{ config, pkgs, ... }:

{
  # Move the nvim folder to ~/.config/
  xdg.configFile."nvim".source = /home/sven/.config/nvim;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
