return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim"
  },

  config = function()
    local git_icons = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "➜",
      untracked = "",
      deleted = "",
      ignored = "◌",
    }


    require("nvim-tree").setup({
      -- show lsp diagnostics in the signcolumn
      diagnostics = {
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      renderer = {
        icons = {
          glyphs = {
            git = git_icons,
          },
        },
      },
      actions = {
        open_file = {
          resize_window = false,
          window_picker = {
            enable = false,
          },
        },
      },
      view = {
        -- width of the window, can be either a number (columns) or a string in `%`
        width = 30,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = "right",
        number = false,
        relativenumber = false,
      },
    })

    vim.api.nvim_set_keymap(
      "n",
      "<leader>fe",
      "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>",
      { noremap = true, silent = true }
    )

    -- auto close nvim-tree
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
      pattern = "NvimTree_*",
      callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
          vim.cmd("confirm quit")
        end
      end
    })
  end
}
