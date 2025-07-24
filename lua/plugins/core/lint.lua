return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        python = {"flake8"},
        cpp = {"clangtidy"},
        java = {"checkstyle"},
        javascript = {"eslint_d"},
        typescript = {"eslint_d"},
        lua = {"luacheck"},
        sh = {"shellcheck"},
        rust = {"cargo"},
        antlr = {"antlr4"},
        ebnf = {"bnfc"}
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  }
}
