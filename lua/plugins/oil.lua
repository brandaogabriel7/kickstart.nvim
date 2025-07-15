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
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name)
          return name:match '^%.'
        end,
        is_always_hidden = function(name)
          return name:match '^%.git$' or name:match '^%.DS_Store$'
        end,
      },
    }
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
