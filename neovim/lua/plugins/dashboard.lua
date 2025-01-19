
vim.cmd([[
:hi DashboardIcon guifg=#ffa0a0
:hi DashboardDesc guifg=#ff80ff
:hi DashboardKey guifg=#ff00ff
:hi DashboardFooter guifg=#AAAAAA
]])

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
