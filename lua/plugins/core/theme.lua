return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
        },
        contrast = "hard",
        palette_overrides = {
          dark0_hard = "#1d2021",
          dark0 = "#282828",
          dark1 = "#3c3836",
          gray = "#928374",
          bright_red = "#fb4934",
          bright_green = "#b8bb26",
          bright_yellow = "#fabd2f",
          bright_blue = "#83a598",
          bright_purple = "#d3869b",
          bright_aqua = "#8ec07c",
          bright_orange = "#fe8019",
        },
        overrides = {
          ["@comment"] = { fg = "#928374", italic = true },
          -- Adicione seus outros overrides aqui
        },
      })

      vim.cmd("colorscheme gruvbox")
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1d2021" })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#83a598" })
    end,
  }
}
