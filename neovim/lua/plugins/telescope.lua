
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

return {
    'nvim-telescope/telescope.nvim',
	 'nvim-telescope/telescope-fzf-native.nvim',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
