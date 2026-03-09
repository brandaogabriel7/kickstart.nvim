return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
      },
      sections = {
        lualine_c = {
          { 'filename', path = 1 }, -- 0=filename, 1=relative path, 2=absolute
        },
        lualine_y = {
          function()
            local ok, pomo = pcall(require, 'pomo')
            if not ok then
              return ''
            end
            local timer = pomo.get_first_to_finish()
            if timer == nil then
              return ''
            end
            return '󰄉 ' .. tostring(timer)
          end,
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
