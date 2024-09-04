return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/school/*.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/school/*.md",
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
    new_notes_location = "current_dir",
    prepend_note_id = true,
    prepend_note_path = false,

  },
  config = function()
    require('obsidian').setup({
      workspaces = {
        {
          name = "school",
          path = "~/school/",
        },
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      -- By default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ "open", url }) -- Mac OS
      end,
      -- By default when you use `:ObsidianFollowLink` on a link to an image
      -- file it will be ignored but you can customize this behavior here.
      ---@param img string
      follow_img_func = function(img)
        vim.fn.jobstart { "qlmanage", "-p", img } -- Mac OS quick look preview
      end,
      vim.api.nvim_set_keymap('n', '<leader>ip', '<cmd>ObsidianPasteImg<cr>', { noremap = true, silent = true })
    })
  end
}
