{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "none";
      };

      display = {
        separator = "  ";
        color = {
          keys  = "33";
          title = "33";
        };
      };

      modules = [
        {
          type   = "title";
          format = "{6}{user-name}{8}@{2}{host-name}";
        }
        {
          type   = "custom";
          format = "\\e[38;5;239m──────────────────────────────\\e[0m";
        }
        {
          type     = "os";
          key      = "  OS";
          keyColor = "33";
        }
        {
          type     = "kernel";
          key      = "  Kernel";
          keyColor = "33";
        }
        {
          type     = "packages";
          key      = "  Packages";
          keyColor = "33";
        }
        {
          type     = "shell";
          key      = "  Shell";
          keyColor = "33";
        }
        {
          type     = "wm";
          key      = "  WM";
          keyColor = "33";
        }
        {
          type     = "terminal";
          key      = "  Terminal";
          keyColor = "33";
        }
        {
          type     = "font";
          key      = "  Font";
          keyColor = "33";
        }
        {
          type     = "cpu";
          key      = "  CPU";
          keyColor = "33";
        }
        {
          type     = "memory";
          key      = "  RAM";
          keyColor = "33";
        }
        {
          type     = "disk";
          key      = "  Disk";
          keyColor = "33";
        }
        {
          type     = "uptime";
          key      = "  Uptime";
          keyColor = "33";
        }
        {
          type   = "custom";
          format = "\\e[38;5;239m──────────────────────────────\\e[0m";
        }
        {
          type   = "colors";
          symbol = "circle";
          paddingLeft = 1;
        }
      ];
    };
  };
}
