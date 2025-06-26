{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    #Provisioning
    ansible
    terraform

    # Container
    docker
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

