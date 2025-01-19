-- Save
vim.api.nvim_set_keymap('i', '<C-w>', '<Esc>:w<CR>a', {})
vim.api.nvim_set_keymap('n', '<C-w>', ':w<CR>', {})

-- VSCode-like
	-- Tabbing
vim.api.nvim_set_keymap('v', '<Tab>', '>', {})
vim.api.nvim_set_keymap('v', '<S-Tab>', '<', {})

