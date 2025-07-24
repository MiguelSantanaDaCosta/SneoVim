local map = vim.keymap.set

-- Atalhos gerais
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Navegação entre erros
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Configuração para compilar e executar C++ com F5
local function compile_run_cpp()
  local filename = vim.fn.expand('%')  -- Nome do arquivo atual
  local output = vim.fn.expand('%:t:r')  -- Nome do arquivo sem extensão
  
  if not filename:match('%.cpp$') then
    vim.notify("Este comando só funciona para arquivos .cpp", vim.log.levels.ERROR)
    return
  end

  -- Comando para compilar e executar
  local cmd = string.format('g++ -std=c++17 -Wall -Wextra %s -o %s && ./%s && read -p \"Press enter to continue"', 
                          filename, output, output)
  
  -- Executar no terminal flutuante
  require('toggleterm').exec(cmd, 1, 15, nil, 'float')
end

-- Mapeamento corrigido
map('n', '<F5>', function()
  vim.cmd('w')  -- Salva o arquivo antes
  compile_run_cpp()
end, { desc = "Compilar e executar C++" })
