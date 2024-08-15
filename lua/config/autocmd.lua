-- yank highlighting
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Autoformat on save",
  callback = function()
    vim.lsp.buf.format()
  end
})
