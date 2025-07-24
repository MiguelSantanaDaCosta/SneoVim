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
