return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'dracula',
      },
      sections = {
        lualine_c = {
          { 'filename', path = 1 }, -- 0=filename, 1=relative path, 2=absolute
        },
        lualine_z = {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
          end,
        },
      },
    }
  end,
}
