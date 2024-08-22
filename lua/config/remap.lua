-- don't need this because of nvim-tree
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- terminal commands
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('n', '<leader>to', '<cmd>terminal<CR>')
vim.keymap.set('n', '<leader>tc', '<cmd>BufferClose!<CR>')

-- change focus to file explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>")

-- move selected lines up and down, obsolete from minimove
--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append next line to current while maintiaining cursor placement
vim.keymap.set("n", "J", "mzJ`z")

-- skip a few lines down and up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- clear highlight for search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- keep cursor in middle on search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without replacing buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- unmap Ex mode
vim.keymap.set("n", "Q", "<nop>")
-- split current buffer, navigate split buffers
vim.keymap.set("n", "<leader>bs", "<C-w>v")
vim.keymap.set("n", "<leader>bh", "<C-w>h")
vim.keymap.set("n", "<leader>bl", "<C-w>l")

-- close current split buffer, close other split buffer
vim.keymap.set("n", "<leader>bq", "<C-w>q")
vim.keymap.set("n", "<leader>bo", "<C-w>o")

-- format current file
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

-- quickfix
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>fd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- start replacing current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file x-ecutable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
