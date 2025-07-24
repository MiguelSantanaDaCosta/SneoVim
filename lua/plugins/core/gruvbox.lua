return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,  -- Carrega imediatamente
    config = function()
      -- Configuração principal do tema
      require("gruvbox").setup({
        -- Configurações de estilo básicas
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
        },
        strikethrough = true,
        invert_selection = false,
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
          ["@string"] = { fg = "#b8bb26", italic = false },
          ["@keyword"] = { fg = "#fb4934", bold = true },
          ["@conditional"] = { fg = "#fb4934", bold = false },
          ["@operator"] = { fg = "#fe8019" },
          ["@function"] = { fg = "#fabd2f", bold = true },
          ["@method"] = { fg = "#fabd2f", bold = false },
          ["@type"] = { fg = "#83a598" },
          ["@constructor"] = { fg = "#8ec07c" },
          ["@variable"] = { fg = "#ebdbb2" },
          ["@constant"] = { fg = "#d3869b" },
          ["@number"] = { fg = "#d3869b" },
          ["@boolean"] = { fg = "#d3869b", bold = true },
          ["@error"] = { fg = "#fb4934", bold = true },
          ["@todo"] = { fg = "#fabd2f", bold = true },
          ["@tag"] = { fg = "#8ec07c" },
        },
        dim_inactive = false,
        transparent_mode = false
      })

      -- Aplica o esquema de cores
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
      
      -- Configurações extras pós-carregamento
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1d2021" })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#83a598" })
    end
  }
}
