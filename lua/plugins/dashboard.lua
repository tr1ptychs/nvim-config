local icons = require('utils.icons')
return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('dashboard').setup {
        -- config
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = icons.folderOpenNoBg,
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              icon = icons.treeDiagram,
              icon_hl = '@variable',
              desc = 'Explorer',
              group = 'Lablel',
              action = "lua require('nvim-tree.api').tree.toggle()",
              key = 'e'
            },
            {
              icon = icons.console,
              icon_hl = '@variable',
              desc = 'Terminal',
              group = 'Lablel',
              action = "terminal",
              key = 't'
            },
          },
        },
      }
      vim.keymap.set('n', '<leader>db', '<Cmd>Dashboard<Cr>', { noremap = true, silent = true })
    end,
  }
}
