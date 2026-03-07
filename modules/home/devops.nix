{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Provisioning
    ansible
    terraform
    terraform-docs
    tflint
    terragrunt

    # Container
    docker-compose
    kubectl
    kubectx
    minikube
    k9s
    helm

    # Network
    inetutils
    wireguard-tools
    nmap
    dig
    httpie

    # Secrets / Credentials
    vault
    sops

    # System Monitoring
    htop
    ncdu
    iotop
    nethogs
    lazydocker

    # Data / Parsing
    jq
    yq
    fx
  ];
}
