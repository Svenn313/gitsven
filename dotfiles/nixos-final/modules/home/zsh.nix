{ config, pkgs, ... }:

{
  programs.zsh = {
    oh-my-zsh = {
      theme   = "powerlevel10k/powerlevel10k";
      plugins = [
        "git"
        "aliases"
        "alias-finder"
        "ansible"
        "docker"
        "docker-compose"
        "sudo"
        "ssh-agent"
        "kubectl"
      ];
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src  = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src  = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-completions";
        src  = pkgs.zsh-completions;
        file = "share/zsh-completions/zsh-completions.zsh";
      }
    ];

    initContent = ''
      zstyle ':omz:plugins:alias-finder' autoload yes
      zstyle ':omz:plugins:alias-finder' longer yes
      zstyle ':omz:plugins:alias-finder' exact yes
      zstyle ':omz:plugins:alias-finder' cheaper yes

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      export PATH="$HOME/.local/bin:$PATH"
    '';
  };

  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];
}
