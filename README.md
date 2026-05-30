# 🛠️ Tosko Vim - Configuração Personalizada

Uma configuração elegante, rápida e modular para o Vim clássico/Neovim, inspirada na experiência visual e fluxo de trabalho do **LazyVim**.

---

## ✨ Recursos Principais

- 🚀 **Dashboard Personalizado**: Tela de início estilizada com ASCII art do **Tosko Vim**, arquivos recentes e favoritos (`vim-startify`).
- 🔍 **Busca Instantânea (FZF)**: Localize arquivos pelo nome ou faça buscas de texto em todo o projeto (estilo Ctrl+F global) de forma ultra veloz usando `ripgrep`.
- 🎨 **Aparência Premium**: Ícones de arquivos e pastas (`vim-devicons`), guias de indentação vertical (`indentLine`) e temas modernos de cores integrados (OneDark, Dracula, Nord, Gruvbox).
- 📂 **Explorador de Arquivos**: Barra lateral interativa (`NERDTree`) integrada com ícones e atalhos de criação/exclusão.
- 🤝 **Fechamento Automático (Autopairs)**: Fechamento inteligente de parênteses, colchetes, chaves e aspas.
- 🌿 **Git Integrado**: Sinalizadores visuais de linhas adicionadas/removidas no arquivo (`vim-gitgutter`) e painel de controle Git completo (`vim-fugitive`).
- 🤖 **Inteligência Artificial**: Autocompletar inteligente com IA (`TabNine`).
- 📝 **Markdown Rich Preview**: Visualize arquivos `.md` renderizados em tempo real no seu navegador (`markdown-preview.nvim`) ou direto no terminal com o `glow`.

---

## 📋 Pré-requisitos

1. **Nerd Font**: Para exibir os ícones corretamente, você precisa configurar seu terminal com uma Nerd Font. Recomendamos:
   - `FiraCode Nerd Font Mono`
   - `Hack Nerd Font Mono`
2. **Ripgrep**: Necessário para o buscador de textos funcionar de forma instantânea.
   - *Linux (Ubuntu/Debian)*: `sudo apt install ripgrep`

---

## 🚀 Instalação e Configuração

### 🐧 No Linux / macOS

1. Clone este repositório no local de sua preferência:
   ```bash
   git clone https://github.com/SammLopes/vim-config-tosko-.git ~/config-vim
   ```
2. Acesse a pasta e execute o script de instalação para criar os links simbólicos necessários:
   ```bash
   cd ~/config-vim
   chmod +x setup.sh
   ./setup.sh
   ```

### 🪟 No Windows

1. Clone o repositório:
   ```cmd
   git clone https://github.com/SammLopes/vim-config-tosko-.git %USERPROFILE%\config-vim
   ```
2. Acesse a pasta e execute o instalador para Windows:
   ```cmd
   cd %USERPROFILE%\config-vim
   setup.bat
   ```

---

## ⚡ Atalhos Rápidos (Leader Key = `Espaço`)

### 🔍 Busca Rápida (FZF)
| Atalho | Ação |
| :--- | :--- |
| `<Space>ff` | Buscar arquivos por nome no projeto |
| `<Space>fg` | Buscar textos dentro dos arquivos (Ctrl+F global) |
| `<Space>fb` | Listar e alternar entre arquivos abertos (buffers) |

### 📂 Navegação & Arquivos
| Atalho | Ação |
| :--- | :--- |
| `<Space>e` | Abre / Fecha o explorador lateral (NERDTree) |
| `<Space>r` | Revela/localiza o arquivo atual no NERDTree |
| `<Space>n` | Ir para a próxima aba/buffer |
| `<Space>p` | Voltar para a aba/buffer anterior |
| `<Space>x` | Fechar aba/buffer atual |

### 🌿 Git
| Atalho | Ação |
| :--- | :--- |
| `<Space>gs` | Abre painel interativo de Status do Git |
| `<Space>gd` | Abre divisão de tela mostrando as diferenças (Git Diff) |
| `<Space>gb` | Executa o Git Blame na linha atual |
| `]c` / `[c` | Pula para a próxima / anterior alteração no arquivo |
| `<Space>ghp`| Pré-visualiza as alterações do bloco sob o cursor |

### 🖥️ Terminal Integrado (nativo do Vim)
O Vim 9 já traz terminal embutido — não precisa de plugin.

| Comando | Ação |
| :--- | :--- |
| `:terminal` | Abre um terminal em divisão horizontal (embaixo) |
| `:vert terminal` | Abre um terminal em divisão vertical (lateral) |
| `:tab terminal` | Abre um terminal em uma **aba nova** |

Dentro do terminal os atalhos `<Space>` não funcionam (o teclado vai para o shell). Use o prefixo `Ctrl-w` (teclas em sequência, não juntas):

| Teclas | Ação |
| :--- | :--- |
| `Ctrl-w` `w` | Pula para a próxima janela (split) |
| `Ctrl-w` `h` / `l` / `j` / `k` | Pula para a janela à esquerda / direita / baixo / cima |
| `Ctrl-w` `gt` / `gT` | Vai para a próxima / anterior aba |
| `Ctrl-w` `N` | Congela o terminal e entra em modo normal (rolar/copiar); `i` volta a digitar |

**Fechar o terminal** (o shell ainda está rodando, por isso precisa forçar): digite `exit` no shell, ou aperte `Ctrl-w` e digite `:bd!` + `Enter`.

### 🎨 Temas Rápidos
| Tecla | Tema |
| :--- | :--- |
| `F5` | Nord |
| `F6` | Dracula |
| `F8` | Gruvbox |
| Padrao | OneDark |

---

## ⚙️ Estrutura do Repositório

```text
vim-config/
├── .agents/          # Manuais e documentações de IA
├── autoload/         # Arquivos de inicialização do vim-plug
├── plugged/          # Plugins baixados
├── vimrc             # Arquivo principal de configurações
├── setup.sh          # Script de instalação Linux
└── setup.bat         # Script de instalação Windows
```
