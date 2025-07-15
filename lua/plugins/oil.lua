return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = {
    { 'echasnovski/mini.icons', opts = {} },
    {
      'benomahony/oil-git.nvim',
      dependencies = { 'stevearc/oil.nvim' },
    },
  },
  lazy = false,
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = {
        'icon',
      },
    }
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
