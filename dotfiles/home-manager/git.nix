{ pkgs, lib, config, ... }: {
  programs.git = {
    enable = true;
    userName = "Svenn313";
    userEmail = "sven313@protonmail.com";
  extraConfig = {
    commit.gpgsign = true;
    user.signingkey = "9AB648072633844F";
    color = { ui = "auto"; };
    pull = { rebase = true; };
    core = {
      excludesfile = "~/.gitignore_global";
    };
  };
};
}
