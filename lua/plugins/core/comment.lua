return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      require("Comment").setup({
        padding = true, -- Add a space b/w comment and the line
        sticky = true, -- Whether the cursor should stay at its position
        ignore = nil, -- Lines to be ignored while (un)comment
        toggler = {
          line = "gcc", -- Line-comment toggle keymap
          block = "gbc", -- Block-comment toggle keymap
        },
        opleader = {
          line = "gc", -- Line-comment keymap
          block = "gb", -- Block-comment keymap
        },
        extra = {
          above = "gcO", -- Add comment on the line above
          below = "gco", -- Add comment on the line below
          eol = "gcA", -- Add comment at the end of line
        },
        mappings = {
          basic = true, -- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
          extra = true, -- Includes `gco`, `gcO`, `gcA`
        },
        pre_hook = nil, -- Function to call before (un)comment
        post_hook = nil, -- Function to call after (un)comment
      })

      -- Add keymaps for visual mode
      vim.keymap.set("x", "gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment toggle linewise (visual)" })
      vim.keymap.set("x", "gb", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Comment toggle blockwise (visual)" })
    end
  }
}
