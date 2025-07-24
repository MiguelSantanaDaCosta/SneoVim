local M = {}

-- Tabela de configuração global
M.settings = {
  -- Plugins essenciais (sempre carregados)
  core_plugins = {
    "alpha", "autopairs", "comment", "gitsigns", "gruvbox",
    "lint", "lsp", "session", "telescope", "tools", "treesitter", "which-key"
  },
  
  -- Linguagens e seus LSPs (para adição fácil)
  languages = {
  
  }
}

-- Função para adicionar nova linguagem
function M.add_language(lang, plugin, lsp)
  M.settings.languages[lang] = {
    plugin = plugin,
    lsp = lsp
  }
end

-- Função para instalar LSPs automaticamente
function M.install_lsps()
  local lsps = {}
  for _, settings in pairs(M.settings.languages) do
    if settings.lsp then
      table.insert(lsps, settings.lsp)
    end
  end
  
  require("mason-lspconfig").setup({
    ensure_installed = lsps,
    automatic_installation = true,
  })
end

-- Função para carregar configuração
function M.setup()
  -- Carrega configurações básicas
  require("options")
  require("keymaps")
  require("filetypes")
  
  -- Configura o Lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  
  -- Carrega todos os plugins
  require("lazy").setup("plugins")
end

return M
