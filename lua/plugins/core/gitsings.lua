return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
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
        yadm = {
          enable = false
        },
      })

      -- Keymaps
      vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "Next hunk" })
      vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "Prev hunk" })
      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
      vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })
      vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
      vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
      vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', { desc = "Stage buffer" })
      vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
      vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', { desc = "Reset buffer" })
      vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
      vim.keymap.set('n', '<leader>hb', '<cmd>Gitsigns blame_line<CR>', { desc = "Blame line" })
      vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle blame" })
      vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', { desc = "Diff this" })
      vim.keymap.set('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = "Diff this ~" })
      vim.keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', { desc = "Toggle deleted" })
    end
  }
}
