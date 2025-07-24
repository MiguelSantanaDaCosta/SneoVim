-- ~/.config/nvim/lua/plugins/core/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "rmagatti/session-lens",  -- Adicione esta dependência
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      -- Carrega extensões de forma segura com verificação
      local load_extension = function(ext)
        local ok, _ = pcall(telescope.load_extension, ext)
        if not ok then
          vim.notify("Failed to load telescope extension: " .. ext, vim.log.levels.WARN)
        end
      end

      load_extension("file_browser")
      load_extension("ui-select")
      load_extension("session-lens")  -- Agora usando o nome correto

      -- Atalhos
      local map = vim.keymap.set
      local builtin = require("telescope.builtin")
      
      map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
      map("n", "<leader>fe", telescope.extensions.file_browser.file_browser, { desc = "File explorer" })
      map("n", "<leader>fs", function()
        require('telescope').extensions['session-lens'].search_session()
      end, { desc = "Search sessions" })
    end,
  },
}

