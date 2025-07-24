return {
  -- ====================== LINGUAGENS DE PROGRAMAÇÃO ======================
  -- Suporte para C/C++
  {
    "p00f/clangd_extensions.nvim",
    ft = {"c", "cpp", "h", "hpp"},
    config = function()
      require("clangd_extensions").setup({
        server = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
          },
        },
      })
    end,
  },

  -- Suporte para Python
  {
    "python-mode/python-mode",
    ft = "python",
    config = function()
      vim.g.python3_host_prog = "/usr/bin/python3"  -- Ajuste para seu caminho do Python
    end,
  },

  -- Suporte para Rust
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      require("rust-tools").setup({
        server = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
            },
          },
        },
      })
    end,
  },

  -- Suporte para Java
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },

  -- ====================== LINGUAGENS DE FORMALISMO ======================
  -- Suporte para EBNF
  {
    "vim-scripts/ebnf.vim",
    ft = "ebnf",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ebnf",
        callback = function()
          vim.bo.commentstring = "(* %s *)"
        end,
      })
    end,
  },

  -- Suporte para ANTLR (.g4)
  {
    "dylon/vim-antlr",
    ft = "antlr",
    config = function()
      vim.g.antlr_highlight = 1
      vim.g.antlr_javacomplete = 1
    end,
  },

  -- ====================== FERRAMENTAS ADICIONAIS ======================
  -- Syntax highlighting adicional
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c", "cpp", "python", "rust", "java",
        "lua", "bash", "javascript", "typescript",
      },
    },
  },

  -- Linters específicos
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = {"flake8"},
        cpp = {"clangtidy"},
        rust = {"cargo"},
        ebnf = {"bnfc"},
        antlr = {"antlr4"},
      },
    },
  },
}
