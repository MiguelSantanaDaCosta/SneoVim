return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[ ███████╗ █████╗ ███╗   ██╗████████╗ █████╗ ███╗   ██╗ █████╗ ]],
        [[ ██╔════╝██╔══██╗████╗  ██║╚══██╔══╝██╔══██╗████╗  ██║██╔══██╗]],
        [[ ███████╗███████║██╔██╗ ██║   ██║   ███████║██╔██╗ ██║███████║]],
        [[ ╚════██║██╔══██║██║╚██╗██║   ██║   ██╔══██║██║╚██╗██║██╔══██║]],
        [[ ███████║██║  ██║██║ ╚████║   ██║   ██║  ██║██║ ╚████║██║  ██║]],
        [[ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝]],
        [[                                                              ]],
        [[                      Bem-vindo, Santana                      ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "  > Explorer", ":NvimTreeToggle<CR>"),
        dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  > Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "  > Session", ":Telescope session-lens search_session<CR>"),
        dashboard.button("g", "  > Live grep", ":Telescope live_grep<CR>"),
        dashboard.button("c", "  > Configuration", ":e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("q", "  > Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.config)
    end,
  }
}
