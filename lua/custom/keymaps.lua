-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '\\', '<CMD>:sp<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '|', '<CMD>:vsp<CR>', { desc = 'Split window vertically' })

-- -- Copilot Chat keymaps
vim.keymap.set('n', '<leader>at', '<Cmd>CopilotChatOpen<CR>', { desc = 'Open  Chat' })
--
-- Quick Chat function
local function quick_chat(selection_type)
  return function()
    vim.ui.input({ prompt = 'Quick Chat: ' }, function(input)
      if input ~= nil and input ~= '' then
        require('CopilotChat').ask(input, { selection = require('CopilotChat.select')[selection_type] })
      end
    end)
  end
end
vim.keymap.set('v', '<leader>at', quick_chat 'visual', { desc = 'Quick Chat' })

-- next buffer
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })

-- pre buffer
vim.keymap.set('n', '[b', ':bprevious<CR>', { desc = 'Previous buffer' })

-- close buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = 'Close buffer' })

-- mini  file
vim.keymap.set('n', '<Leader>e', function()
  if not require('mini.files').close() then
    require('mini.files').open()
  end
end, { desc = 'open file exploer' })

-- mini pair
vim.keymap.set('n', '<leader>tp', function()
  if vim.b.minipairs_disable == nil then
    vim.b.minipairs_disable = vim.g.minipairs_disable
  end
  vim.b.minipairs_disable = not vim.b.minipairs_disable
end, { desc = 'toggle Mini Pairs' })
