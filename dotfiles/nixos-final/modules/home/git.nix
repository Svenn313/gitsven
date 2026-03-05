{ pkgs, lib, config, ... }:

{
  programs.git = {
    enable   = true;
    settings = {
      user.name         = "Svenn313";
      user.email        = "sven313@protonmail.com";
      commit.gpgsign    = true;
      user.signingkey   = "9AB648072633844F";
      color.ui          = "auto";
      pull.rebase       = true;
      core.excludesfile = "~/.gitignore_global";
    };
  };
}
