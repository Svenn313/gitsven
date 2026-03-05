{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Provisioning
    ansible
    terraform
    # Container (CLI uniquement, daemon géré dans modules/docker.nix)
    docker-compose
    # Network
    inetutils
    wireguard-tools
    nmap
    tmux
    tmux-cssh
    # System Monitoring
    htop
    ncdu
    jq
    yq
  ];
}
