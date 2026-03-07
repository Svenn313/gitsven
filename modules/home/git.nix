{ pkgs, lib, config, ... }:

{
  programs.git = {
    settings = {
      user.name         = "Svenn313";
      user.email        = "sven313@protonmail.com";
      commit.gpgsign    = true;
      user.signingkey   = "1F1C6D535C4506DE";
      color.ui          = "auto";
      pull.rebase       = true;
      core.excludesfile = "~/.gitignore_global";
    };
  };
}
