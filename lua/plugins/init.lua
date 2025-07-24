local M = {}

function M.setup()
end

return {
  -- Tema deve vir primeiro
  { import = "plugins.core.gruvbox" },  -- Movido para o topo e removida a duplicação
  
  -- Plugins principais
  { import = "plugins.core.alpha" },       -- Dashboard
  { import = "plugins.core.session" },     -- Gerenciamento de sessão (antes do telescope)
  { import = "plugins.core.telescope" },   -- Navegação e busca
  { import = "plugins.core.lint" },        -- Verificação de sintaxe
  { import = "plugins.core.lsp" },         -- LSP e autocompletar
  { import = "plugins.core.treesitter" },  -- Syntax highlighting
  { import = "plugins.core.tools" },       -- Ferramentas diversas
  { import = "plugins.core.gitsigns" },    -- Git signs
  { import = "plugins.core.which-key" },   -- Keybindings helper
  { import = "plugins.core.comment" },     -- Commenting
  { import = "plugins.core.autopairs" },   -- Corrigido espaçamento
  
    -- Suporte a linguagens específicas
  { import = "plugins.languages" },
}
