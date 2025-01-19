return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
   vim.keymap.set('n', '<Tab>', ':NvimTreeToggle<CR>', { noremap = true, silent = true, buffer = bufnr })
	vim.keymap.set('n', '`', ':NvimTreeOpen<CR>', { noremap = true, silent = true, buffer = bufnr })
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', '<Tab>', ':NvimTreeClose<CR>', { noremap = true, silent = true, buffer = bufnr })
		vim.keymap.set('n', '<C-CR>', api.tree.change_root_to_node, {})
    end

    -- Pass to setup along with other options
    require("nvim-tree").setup {
      on_attach = my_on_attach,
		}
  end,
}
