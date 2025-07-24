return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      
      -- Basic setup with better defaults
      wk.setup({
        plugins = {
          spelling = { enabled = true },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true
          }
        },
        window = {
          border = "single",
          position = "bottom",
          margin = { 1, 0, 1, 0 }  -- Extra margin
        },
        ignore_missing = true,  -- Prevents errors for unmapped keys
        triggers_blacklist = {
          -- List of mode / prefixes that should never be hooked
          i = { "j", "k" },
          v = { "j", "k" }
        }
      })

      -- Unified mappings definition (better maintainability)
      local mappings = {
        ["<leader>"] = {
          f = {
            name = "Find",
            f = { "<cmd>Telescope find_files<cr>", "Files" },
            g = { "<cmd>Telescope live_grep<cr>", "Grep" },
            b = { "<cmd>Telescope buffers<cr>", "Buffers" },
            h = { "<cmd>Telescope help_tags<cr>", "Help" },
            r = { "<cmd>Telescope oldfiles<cr>", "Recent" },
            e = { "<cmd>Telescope file_browser<cr>", "Explorer" },
            s = { "<cmd>Telescope session-lens search_session<cr>", "Sessions" },
          },
          g = {
            name = "Git",
            s = { "<cmd>Neogit<cr>", "Status" },
            c = { "<cmd>Neogit commit<cr>", "Commit" },
            p = { "<cmd>Neogit push<cr>", "Push" },
            l = { "<cmd>Neogit pull<cr>", "Pull" },
            b = { "<cmd>Neogit branch<cr>", "Branch" },
          },
          h = { name = "Git Hunk" },
          l = { name = "LSP" },
          s = { name = "Session" },
          t = { name = "Toggle" },
        },
        g = {
          name = "Goto",
          d = { vim.lsp.buf.definition, "Definition" },
          D = { vim.lsp.buf.declaration, "Declaration" },
          r = { vim.lsp.buf.references, "References" },
          i = { vim.lsp.buf.implementation, "Implementation" },
        },
      }

      -- Register all mappings at once
      wk.register(mappings)

      -- Enhanced keybindings to show which-key
      vim.keymap.set("n", "<leader>", function()
        wk.show(_, nil, nil, {mode = "n", prefix = "<leader>"})
      end, { desc = "Show leader keys" })
      
      vim.keymap.set("n", "g", function()
        wk.show(_, nil, nil, {mode = "n", prefix = "g"})
      end, { desc = "Show goto keys" })
    end
  }
}
