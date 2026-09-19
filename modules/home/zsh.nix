{ config, pkgs, ... }:

{
  home.sessionVariables = {
    LESS = "-R --mouse";
  };

  programs.zsh = {
    autocd = true;         
    enableCompletion = true;

    history = {
      size = 50000;
      save = 50000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      extended = true;
    };

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
      ls = "eza --icons";
      ll = "eza -la --icons";
      lt = "eza --tree --icons -L 2";
    };

    initContent = ''
      zstyle ':omz:plugins:alias-finder' autoload yes
      zstyle ':omz:plugins:alias-finder' longer yes
      zstyle ':omz:plugins:alias-finder' exact yes
      zstyle ':omz:plugins:alias-finder' cheaper yes

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      DISABLE_AUTO_TITLE="true"
      export PATH="$HOME/.local/bin:$PATH"
      export GPG_TTY=$(tty)
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      setopt NO_BEEP
      setopt CORRECT
      setopt AUTO_PUSHD
      setopt PUSHD_IGNORE_DUPS
      setopt PUSHD_SILENT

      mkcd() { mkdir -p "$1" && cd "$1" }

      extract() {
        case $1 in
          *.tar.gz|*.tgz) tar xzf "$1" ;;
          *.tar.bz2) tar xjf "$1" ;;
          *.zip) unzip "$1" ;;
          *.rar) unrar x "$1" ;;
          *) echo "Format non supporté" ;;
        esac
      }

      syscheck() {
        local cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}')
        local load=$(cut -d' ' -f1-3 /proc/loadavg | tr ' ' '/')
        local mem=$(free -h | awk '/^Mem:/{printf "%s/%s", $3, $2}')
        local swap=$(free -h | awk '/^Swap:/{printf "%s/%s", $3, $2}')
        local disk=$(df -h / | awk 'NR==2{printf "%s/%s (%s)", $3, $2, $5}')
        local iface=$(ip route get 1.1.1.1 | awk '{print $5; exit}')
        local rx1=$(cat /proc/net/dev | awk -v i="$iface:" '$1==i {print $2}')
        local tx1=$(cat /proc/net/dev | awk -v i="$iface:" '$1==i {print $10}')
        sleep 1
        local rx2=$(cat /proc/net/dev | awk -v i="$iface:" '$1==i {print $2}')
        local tx2=$(cat /proc/net/dev | awk -v i="$iface:" '$1==i {print $10}')
        local rxs=$(awk "BEGIN {printf \"%.1f\", ($rx2 - $rx1) / 1048576}")
        local txs=$(awk "BEGIN {printf \"%.1f\", ($tx2 - $tx1) / 1048576}")

        echo ""
        echo "  $(hostname)  —  $(date '+%H:%M:%S')"
        echo "  ─────────────────────────────"
        echo "  CPU   ''${cpu}%   load ''${load}"
        echo "  RAM   ''${mem}   swap ''${swap}"
        echo "  /     ''${disk}"
        echo "  NET   ''${iface}   ↓ ''${rxs} MB/s   ↑ ''${txs} MB/s"
        echo ""
        df -h | awk 'NR>1 && !/tmpfs|udev|loop|efi/ && $6!="/" {printf "  %-6s %s/%s (%s)\n", $6, $3, $2, $5}'
        echo ""
      }

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

