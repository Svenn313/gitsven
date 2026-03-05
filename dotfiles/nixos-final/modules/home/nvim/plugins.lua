return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        background = { light = "latte", dark = "mocha" },
        integrations = { lsp = true, telescope = true },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
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
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch       = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "neovim/nvim-lspconfig" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft    = "markdown",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("lualine").setup() end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end,
  },
}
