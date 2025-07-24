# SneoVim - Configuração Neovim para Produtividade Extrema

![SneoVim Demo](logo.png)

Uma configuração Neovim moderna e altamente otimizada projetada para desenvolvedores que buscam produtividade máxima. SneoVim combina os melhores plugins com uma configuração inteligente para oferecer uma experiência de desenvolvimento fluida e poderosa.

## Características Principais

✨ **Interface Moderna**  
🎨 **Temas Personalizáveis**  
⚡ **Desempenho Otimizado**  
🧩 **Sistema Modular de Linguagens**  
🤖 **LSP Automático e Inteligente**  
🔧 **Fácil Adição de Novas Linguagens**  
🚀 **Fluxo de Trabalho Turbinado**

## Pré-requisitos

- Neovim (>= 0.9.0)
- Git
- Compiladores (gcc para C/C++, etc.)
- [Nerd Fonts](https://www.nerdfonts.com/) (recomendado)
- Python 3 (para alguns plugins)

## Instalação Rápida

```bash
# Faça backup da sua configuração atual
mv ~/.config/nvim ~/.config/nvim.bak

# Clone o repositório
git clone https://github.com/MiguelSantanaDaCosta/SneoVim.git ~/.config/nvim

# Instale as dependências
sudo apt-get install build-essential python3-pip nodejs npm

# Inicie o Neovim e aguarde a instalação automática
nvim
```

## Gerenciamento de Linguagens

Adicione suporte a novas linguagens com um único comando:

```bash
# Instale o utilitário nvim-lang
curl -L https://raw.githubusercontent.com/MiguelSantanaDaCosta/SneoVim/main/nvim-lang -o ~/.local/bin/nvim-lang
chmod +x ~/.local/bin/nvim-lang

# Adicione novas linguagens
nvim-lang add python nvim-treesitter pyright
nvim-lang add rust rust-tools rust_analyzer
nvim-lang add typescript typescript.nvim tsserver
```

### Comandos Disponíveis:
| Comando                | Descrição                                  |
|------------------------|--------------------------------------------|
| `nvim-lang add`        | Adiciona suporte a uma nova linguagem      |
| `nvim-lang remove`     | Remove suporte a uma linguagem             |
| `nvim-lang list`       | Lista linguagens suportadas                |

## Atalhos Essenciais

### Navegação
| Atalho          | Ação                                 |
|-----------------|--------------------------------------|
| `<leader>e`     | Alternar explorador de arquivos      |
| `<leader>ff`    | Buscar arquivos                      |
| `<leader>fg`    | Buscar texto                         |
| `<leader>fb`    | Buscar buffers                       |

### LSP
| Atalho          | Ação                                 |
|-----------------|--------------------------------------|
| `gd`            | Ir para definição                   |
| `gr`            | Ver referências                     |
| `K`             | Documentação                        |
| `<leader>ca`    | Ações de código                     |
| `<leader>f`     | Formatar código                     |

### Terminal
| Atalho          | Ação                                 |
|-----------------|--------------------------------------|
| `<leader>tt`    | Alternar terminal flutuante          |

### Outros
| Atalho          | Ação                                 |
|-----------------|--------------------------------------|
| `<F5>`          | Compilar e executar C++             |
| `gcc`           | Comentar linha                      |
| `gbc`           | Comentar bloco                      |

## Estrutura do Projeto

```bash
~/.config/nvim/
├── init.lua             # Entrada principal
├── lua/
│   ├── config.lua       # Configuração central
│   ├── options.lua      # Opções do Neovim
│   ├── keymaps.lua      # Atalhos
│   ├── filetypes.lua    # Definição de tipos de arquivo
│   └── plugins/
│       ├── core/        # Plugins essenciais
│       └── languages/   # Configurações por linguagem
└── nvim-lang            # Utilitário CLI para gerenciamento
```

## Personalização

Para personalizar o SneoVim:

1. Edite `lua/config.lua` para adicionar novas linguagens manualmente
2. Modifique `lua/options.lua` para ajustar preferências do Neovim
3. Adicione novos atalhos em `lua/keymaps.lua`

Como Adicionar Novas Linguagens ao SneoVim
Adicionar suporte a novas linguagens no SneoVim é simples e rápido graças ao nosso sistema de gerenciamento CLI. Siga estes passos:

Método 1: Usando o utilitário nvim-lang (recomendado)
Passo a passo:
Instale o utilitário (se ainda não tiver feito):

bash
curl -L https://raw.githubusercontent.com/MiguelSantanaDaCosta/SneoVim/main/nvim-lang -o ~/.local/bin/nvim-lang
chmod +x ~/.local/bin/nvim-lang
Adicione a nova linguagem:

bash
nvim-lang add <linguagem> <plugin> <lsp>
Onde:

<linguagem>: Nome da linguagem (ex: python, go, typescript)

<plugin>: Plugin que fornece suporte à linguagem

<lsp>: Servidor LSP para a linguagem (opcional)

Exemplos:
Para Python:

bash
nvim-lang add python nvim-treesitter pyright
Para Go:

bash
nvim-lang add go nvim-treesitter gopls
Para TypeScript:

bash
nvim-lang add typescript typescript.nvim tsserver
Para linguagens sem LSP (ex: Markdown):

bash
nvim-lang add markdown nvim-treesitter
Reinicie o Neovim para carregar as novas configurações

Método 2: Adicionando manualmente
Passo a passo:
Adicione a linguagem ao config.lua:
Edite ~/.config/nvim/lua/config.lua e adicione:

lua
M.add_language("go", "nvim-treesitter", "gopls")
Crie um arquivo de configuração para a linguagem:
Crie ~/.config/nvim/lua/plugins/languages/go.lua com:

lua
return {
  {
    "nvim-treesitter",
    ft = "go",
    config = function()
      -- Configurações específicas para Go
      require('nvim-treesitter.configs').setup {
        ensure_installed = {"go"},
        highlight = { enable = true },
      }
    end
  }
}
Adicione o LSP ao arquivo de configuração (se aplicável):
Em ~/.config/nvim/lua/plugins/core/lsp.lua, adicione:

lua
lspconfig.gopls.setup({
  capabilities = capabilities,
  filetypes = {"go"},
})
Reinicie o Neovim

Instalando dependências
Para algumas linguagens, você precisará instalar dependências externas:

Para Python:
bash
pip install pyright
Para Go:
bash
go install golang.org/x/tools/gopls@latest
Para Rust:
bash
rustup component add rust-analyzer
Configurações Avançadas
Para personalizar ainda mais o suporte a uma linguagem:

Edite o arquivo específico da linguagem em lua/plugins/languages/

Adicione configurações personalizadas no bloco config

Para configurações específicas do LSP, edite lua/plugins/core/lsp.lua

Exemplo de configuração avançada para Python:
lua
lspconfig.pyright.setup({
  capabilities = capabilities,
  filetypes = {"python"},
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        autoSearchPaths = true,
        diagnosticMode = "workspace",
      }
    }
  }
})
Linguagens Suportadas
Você pode ver todas as linguagens instaladas com:

bash
nvim-lang list
Dicas
Use :TSInstall <linguagem> para instalar suporte do Treesitter

Use :LspInstall <lsp> para instalar novos servidores LSP

Consulte a documentação de cada plugin para configurações avançadas

Linguagens populares já têm suporte pré-configurado:

C/C++ (clangd)

Python (pyright)

Java (jdtls)

Rust (rust_analyzer)

JavaScript/TypeScript (tsserver)


## Contribuição

Contribuições são bem-vindas! Siga estes passos:

1. Faça um fork do repositório
2. Crie uma branch com sua feature (`git checkout -b feature/incrivel`)
3. Faça commit das suas alterações (`git commit -am 'Adiciona feature incrível'`)
4. Faça push para a branch (`git push origin feature/incrivel`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

**SneoVim** - Transforme sua experiência de desenvolvimento. Desenvolvido com ❤️ por [Miguel Santana](https://github.com/MiguelSantanaDaCosta)
