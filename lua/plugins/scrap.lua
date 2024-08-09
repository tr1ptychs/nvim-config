return {
  'tr1ptychs/scrap.nvim',
  config = function ()
    vim.keymap.set('n', '<leader>ts', '<Cmd>:ScrapToggle<Cr>', {})
  end
}
