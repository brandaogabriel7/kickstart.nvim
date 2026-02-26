local copilot_enabled = false

local function toggle_copilot()
  if copilot_enabled then
    vim.cmd('Copilot disable')
    copilot_enabled = false
    vim.notify('Copilot disabled', vim.log.levels.INFO)
  else
    vim.cmd('Copilot enable')
    copilot_enabled = true
    vim.notify('Copilot enabled', vim.log.levels.INFO)
  end
end

return {
  'github/copilot.vim',
  event = 'InsertEnter',
  init = function()
    vim.g.copilot_enabled = false
  end,
  keys = {
    {
      '<leader>cp',
      toggle_copilot,
      desc = 'Toggle Copilot',
    },
    {
      '<C-\\>',
      toggle_copilot,
      mode = 'i',
      desc = 'Toggle Copilot',
    },
  },
}
