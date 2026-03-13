{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua = ''
      vim.o.clipboard = "unnamedplus"
      vim.g.clipboard = {
        name = "OSC 52",
        copy = {
          ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
          ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
          ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
          ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
        },
      }
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

      -- LSP
      local lspconfig = require("lspconfig")
      lspconfig.nixd.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.bashls.setup({})
      lspconfig.yamlls.setup({})

       '';
    extraPackages = with pkgs; [
      # LSP servers
      nixd
      lua-language-server
      pyright
      bash-language-server
      yaml-language-server
      # telescope
      fd
      ripgrep
    ];
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      nvim-tree-lua
      nvim-web-devicons
      telescope-nvim
      plenary-nvim
      nvim-cmp
      cmp-nvim-lsp
      markdown-preview-nvim
      lualine-nvim
      gitsigns-nvim
    ];
  };
}
