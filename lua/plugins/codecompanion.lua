return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/codecompanion-history.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'markdown', 'codecompanion' },
    },
  },
  keys = {
    { '<leader>aa', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'CodeCompanion Actions' },
    { '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, desc = 'CodeCompanion Chat Toggle' },
    { '<leader>ai', '<cmd>CodeCompanion<cr>', mode = { 'n', 'v' }, desc = 'CodeCompanion Inline' },
    { '<leader>ap', '<cmd>CodeCompanionChat Add<cr>', mode = 'v', desc = 'Add selection to Chat' },
  },
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
        cmd = {
          adapter = 'copilot',
        },
      },
      display = {
        chat = {
          window = {
            layout = 'vertical',
            width = 0.4,
          },
        },
      },
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = 'gh',
            save_chat_keymap = 'sc',
            auto_save = true,
            expiration_days = 0,
            picker = 'telescope',
            picker_keymaps = {
              rename = { n = 'r', i = '<M-r>' },
              delete = { n = 'd', i = '<M-d>' },
              duplicate = { n = '<C-y>', i = '<C-y>' },
            },
            auto_generate_title = true,
            title_generation_opts = {
              adapter = nil,
              model = nil,
              refresh_every_n_prompts = 0,
              max_refreshes = 3,
            },
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            dir_to_save = vim.fn.stdpath 'data' .. '/codecompanion-history',
          },
        },
      },
    }
  end,
}
