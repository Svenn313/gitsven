return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- nécessaire pour les icônes
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = function()
    return {
      default_component_configs = {
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
          default = '',
          highlight = 'NeoTreeFileIcon',
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- montrer fichiers cachés
          show_hidden_count = true,
        },
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
      window = {
        width = 30,
      },
    }
  end,
}
