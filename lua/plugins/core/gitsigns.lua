-- ~/.config/nvim/lua/plugins/core/gitsigns.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = {
      "nvim-lua/plenary.nvim"  -- Required dependency
    },
    config = function()
      local gitsigns = require('gitsigns')

      -- Setup with all default configurations
      gitsigns.setup({
        signs = {
          add          = { hl = 'GitSignsAdd',    text = '│', numhl='GitSignsAddNr',    linehl='GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd',    text = '┆', numhl='GitSignsAddNr',    linehl='GitSignsAddLn' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false,  -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false,  -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false,  -- Toggle with `:Gitsigns toggle_word_diff`
        
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      })

      -- Key mappings
      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gitsigns.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = "Next Git hunk" })

      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gitsigns.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = "Previous Git hunk" })

      -- Stage/reset/revert hunks
      vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, { desc = "Reset hunk" })
      
      -- Stage/reset buffer
      vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, { desc = "Reset buffer" })
      
      -- Preview/diff/blame
      vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line({full=true}) end, { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
      vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "Diff this ~" })
      
      -- Toggles
      vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted, { desc = "Toggle deleted" })
    end
  }
}
