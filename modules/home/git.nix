{ config, lib, ... }:
{
  programs.git = {
    settings = {
      signing.format = "null";
      user = {
        name       = "Svenn313";
        email      = "sven313@protonmail.com";
        signingkey = "1F1C6D535C4506DE";
      };
      commit.gpgsign = true;
      color.ui       = "auto";
      pull.rebase    = true;
      core.excludesfile = "~/.gitignore_global";
    };
  };
}
