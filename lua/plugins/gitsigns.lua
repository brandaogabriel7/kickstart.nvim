-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation between hunks
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Next hunk' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Previous hunk' })

      -- Hunk actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })

      -- Stage/reset in visual mode (partial hunk)
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Stage selected lines' })
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Reset selected lines' })

      -- Buffer-level actions
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })

      -- Undo last staged hunk
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })

      -- Preview and blame
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, { desc = 'Blame line (full)' })
      map('n', '<leader>hB', gitsigns.toggle_current_line_blame, { desc = 'Toggle line blame' })

      -- Diff views
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff against index' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis '~'
      end, { desc = 'Diff against last commit' })

      -- Text object for hunks (use with operators like d, y, c)
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
    end,
  },
}
