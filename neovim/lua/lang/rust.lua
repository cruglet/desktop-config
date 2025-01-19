return {
	{ 'rust-lang/rust.vim' },
	{
  		'mrcjkb/rustaceanvim',
  		version = '^5', -- Recommended
  		lazy = false, -- This plugin is already lazy
	},
	config = function()
		require'lspconfig'.rust.setup()
	end,
}
