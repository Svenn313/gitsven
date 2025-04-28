# Minimal Python Template for DevEnv
{ pkgs, ... }:

{
  # Langages
  languages.python.enable = true;
  # languages.python.package = pkgs.python311;  # If I need a specific Python version

  # Python Packages
  packages = with pkgs; [
    python312Packages.pip
    python312Packages.virtualenv
  ];

  enterShell = ''
    echo "Python version: $(python --version)"
  '';
}
