{ pkgs, lib, config, ... }:
{
  programs.git = {
    userName  = "Svenn313";
    userEmail = "sven313@protonmail.com";
    signing = {
      key    = "1F1C6D535C4506DE";
      signByDefault = true;
      format = "openpgp";
    };
    extraConfig = {
      color.ui    = "auto";
      pull.rebase = true;
      core.excludesfile = "~/.gitignore_global";
    };
  };

  programs.gh.gitCredentialHelper.enable = true;
}
