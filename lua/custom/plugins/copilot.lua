return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false }, -- Disable inline suggestions since we'll use cmp
        panel = { enabled = false },
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      window = {
        layout = 'float',
        width = 74, -- absolute width in columns
        height = vim.o.lines - 4, -- absolute height in rows, subtract for command line and status line
        row = 1, -- row position of the window, starting from the top
        col = vim.o.columns - 74, -- column position of the window, aligned to the right
      },
    },
  },
}
