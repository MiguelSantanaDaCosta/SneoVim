-- ~/.config/nvim/lua/plugins/core/session.lua
return {
  {
    "rmagatti/auto-session",
    lazy = false,  -- Carrega imediatamente
    dependencies = {
      "rmagatti/session-lens",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = false,
      })
    end
  },
  {
    "rmagatti/session-lens",
    dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup({
        path_display = { "shorten" },
        theme_conf = { border = true },
        previewer = true
      })
      -- Carrega a extensão do Telescope explicitamente
      require('telescope').load_extension('session-lens')
    end
  }
}
