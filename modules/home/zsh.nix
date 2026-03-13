{ config, pkgs, ... }:

{
  programs.zsh = {
    oh-my-zsh = {
      theme   = ""; # Powerlevel10k, see below
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

    shellAliases = {
      cat = "bat -pp";
      clip = "base64 -w0 | xargs -I{} printf '\e]52;c;{}\a'";
    };

    initContent = ''
      zstyle ':omz:plugins:alias-finder' autoload yes
      zstyle ':omz:plugins:alias-finder' longer yes
      zstyle ':omz:plugins:alias-finder' exact yes
      zstyle ':omz:plugins:alias-finder' cheaper yes

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      
      DISABLE_AUTO_TITLE="true"
      export PATH="$HOME/.local/bin:$PATH"
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        
      function rebuild() {
        echo "sudo nixos-rebuild switch --flake /etc/nixos"
        sudo nixos-rebuild switch --flake /etc/nixos
      }
  
      function update() {
        echo "nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos"
        nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos
      }
  
      function nixgc() {
        echo "sudo nix-collect-garbage -d"
        sudo nix-collect-garbage -d
      }

      function nixdir() {
        echo "cd /etc/nixos"
        cd /etc/nixos
      }
        
    '';
  };

  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];
}
