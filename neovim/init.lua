require("config.lazy")

vim.o.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3

vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none
]]

vim.cmd("set relativenumber")
vim.cmd("set number")

require('mason').setup()
-- Keybindings
--
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })
require("config.keybinds")
