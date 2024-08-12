return {
  'lewis6991/gitsigns.nvim',

  config = function ()
    require('gitsigns').setup()
    vim.keymap.set('n', '<leader>gs', '<Cmd>:Gitsigns toggle_signs<Cr>', {})
  end
}
