return {
  'epwalsh/pomo.nvim',
  version = '*',
  lazy = true,
  cmd = { 'TimerStart', 'TimerRepeat', 'TimerSession' },
  dependencies = {
    'rcarriga/nvim-notify',
  },
  keys = {
    { '<leader>ps', '<cmd>TimerSession pomodoro<cr>', desc = 'Pomodoro session' },
    { '<leader>pb', '<cmd>TimerStart 5m Break<cr>', desc = 'Break timer (5m)' },
    { '<leader>pw', '<cmd>TimerStart 25m Work<cr>', desc = 'Work timer (25m)' },
    { '<leader>pt', ':TimerStart ', desc = 'Custom timer' },
    { '<leader>pp', '<cmd>TimerPause<cr>', desc = 'Pause/resume timer' },
    { '<leader>px', '<cmd>TimerStop<cr>', desc = 'Stop timer' },
  },
  opts = {
    update_interval = 1000,
    notifiers = {
      {
        name = 'Default',
        opts = {
          sticky = false,
          title_icon = '󱎫',
          text_icon = '󰄉',
        },
      },
      { name = 'System' },
    },
    timers = {
      Break = {
        { name = 'Default', opts = { sticky = true, title_icon = '󱎫', text_icon = '󰄉' } },
        { name = 'System' },
      },
    },
    sessions = {
      pomodoro = {
        { name = 'Work', duration = '25m' },
        { name = 'Short Break', duration = '5m' },
        { name = 'Work', duration = '25m' },
        { name = 'Short Break', duration = '5m' },
        { name = 'Work', duration = '25m' },
        { name = 'Long Break', duration = '15m' },
      },
    },
  },
}
