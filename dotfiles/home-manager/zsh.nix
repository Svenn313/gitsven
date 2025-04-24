 { pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "bira";
      plugins = [
        "git"
        "aliases"
        "alias-finder"
        "ansible"
        "vscode"
        "docker"
        "docker-compose"
        "sudo"
        "ufw"
        "ssh-agent"
      ];
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.1";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.8.0";
          sha256 = "1yl8zdip1z9inp280sfa5byjbf2vqh2iazsycar987khjsi5d5w8";
        };
      }
      {
        name = "zsh-bat";
        src = pkgs.fetchFromGitHub {
          owner = "fdellwing";
          repo = "zsh-bat";
          rev = "master";
          sha256 = "0sj8dwqlnd7dz7djs6kv92vsxqai2sc2pq865r7i5lxgjxk9hfsd";
        };
      }
    ];

    shellAliases = {
      # Ajoutez vos alias ici
      nixdir = "$HOME/git/gitsven/dotfiles/";
      nix-update = "sudo nixos-rebuild switch";
      home-update = "home-manager switch";
      cat = "bat -pp";
    };
  };
}
