{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    initLua = ''
      
       if vim.fn.has("wsl") == 1 then
          vim.g.clipboard = {
            name = "win32yank",
            copy = {
              ["+"] = "win32yank.exe -i --crlf",
              ["*"] = "win32yank.exe -i --crlf",
            },
            paste = {
              ["+"] = "win32yank.exe -o --lf",
              ["*"] = "win32yank.exe -o --lf",
            },
            cache_enabled = 0,
          }
      else
        vim.o.clipboard = "unnamedplus"
      end

      vim.opt.expandtab   = true
      vim.opt.shiftwidth  = 2
      vim.opt.tabstop     = 2
      vim.opt.softtabstop = 2
      vim.opt.autoindent  = true
      vim.opt.smartindent = true

      -- nvim-tree
      require("nvim-tree").setup({
        sort_by = "name",
        view = { width = 30, side = "left", preserve_window_proportions = true },
        renderer = {
          highlight_git = true,
          icons = { show = { git = true, folder = true, file = true, folder_arrow = true } },
        },
        filters = { dotfiles = false },
      })
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

      -- catppuccin
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")

      -- lualine
      require("lualine").setup()

      -- gitsigns
      require("gitsigns").setup()
    '';

    plugins = with pkgs.vimPlugins; [
      # theme
      catppuccin-nvim

      # file tree
      nvim-tree-lua
      nvim-web-devicons

      # telescope
      telescope-nvim
      plenary-nvim

      # LSP
      nvim-lspconfig

      # completion
      nvim-cmp
      cmp-nvim-lsp

      # markdown
      markdown-preview-nvim

      # UI
      lualine-nvim
      gitsigns-nvim
    ];
  };
}
