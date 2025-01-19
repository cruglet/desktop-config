return {
  -- Plugin specification for lazy.nvim
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp", -- Completion engine
    "hrsh7th/cmp-nvim-lsp", -- Bridge between nvim-cmp and LSP
  },
  config = function()
    -- Import required modules
    local cmp = require("cmp")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Configure nvim-cmp
    cmp.setup {
      sources = {
        { name = "nvim_lsp" },
      },
    }

    -- Advertise nvim-cmp capabilities to LSP servers
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Configure clangd LSP server
    lspconfig.gdscript.setup {
      capabilities = capabilities,
      -- Add other configurations as necessary
    }
	lspconfig.lua_ls.setup {}
	lspconfig.cssls.setup {}
	lspconfig.html.setup {}
	lspconfig.jsonls.setup {}
	lspconfig.ts_ls.setup {}
  end,
}
