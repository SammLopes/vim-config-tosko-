# 🛠️ Tosko Vim - Configuração Personalizada

Uma configuração elegante, rápida e modular para o Vim clássico/Neovim, inspirada na experiência visual e fluxo de trabalho do **LazyVim**.

*OBS:* Esse projeto é tosko e não deve ser levado a sério. 

---

## ✨ Recursos Principais

- 🚀 **Dashboard Personalizado**: Tela de início estilizada com ASCII art do **Tosko Vim**, arquivos recentes e favoritos (`vim-startify`).
- 🔍 **Busca Instantânea (FZF)**: Localize arquivos pelo nome ou faça buscas de texto em todo o projeto (estilo Ctrl+F global) de forma ultra veloz usando `ripgrep`.
- 🎨 **Aparência Premium**: Ícones de arquivos e pastas (`vim-devicons`), guias de indentação vertical (`indentLine`) e temas modernos de cores integrados (OneDark, Dracula, Nord, Gruvbox).
- 📂 **Explorador de Arquivos**: Barra lateral interativa (`NERDTree`) integrada com ícones e atalhos de criação/exclusão.
- 🤝 **Fechamento Automático (Autopairs)**: Fechamento inteligente de parênteses, colchetes, chaves e aspas.
- 💻 **Suporte Inteligente a Linguagens (LSP)**: Autocompletar inteligente, navegação de código ("ir para definição/referências") e detecção de erros em tempo real via `coc.nvim` (PHP, JS/TS, React, Vue e Java).
- 🌿 **Git Integrado**: Sinalizadores visuais de linhas adicionadas/removidas no arquivo (`vim-gitgutter`) e painel de controle Git completo (`vim-fugitive`).
- 🤖 **Inteligência Artificial**: Autocompletar inline gratuito (`Codeium`) e geração, edição e chat interativo com IA (`vim-ai`).
- 📝 **Markdown Rich Preview**: Visualize arquivos `.md` renderizados em tempo real no seu navegador (`markdown-preview.nvim`) ou direto no terminal com o `glow`.

---

## 📋 Pré-requisitos

1. **Nerd Font**: Para exibir os ícones corretamente, você precisa configurar seu terminal com uma Nerd Font. Recomendamos:
   - `FiraCode Nerd Font Mono`
   - `Hack Nerd Font Mono`
2. **Ripgrep**: Necessário para o buscador de textos funcionar de forma instantânea.
   - *Linux (Ubuntu/Debian)*: `sudo apt install ripgrep`
3. **Glow**: Necessário para visualizar o preview de Markdown diretamente no terminal (`<Space>mt`).
   - *Linux (via Snap)*: `sudo snap install glow`
4. **Lazydocker**: Painel interativo para gerenciamento de Docker e Docker Compose diretamente do terminal do Vim.
   - *Linux (Script de Instalação)*: `curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash`

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
| `<Space>d` | Abre o painel do Docker (lazydocker) em uma nova aba |

### 🌿 Git
| Atalho | Ação |
| :--- | :--- |
| `<Space>gs` | Abre painel interativo de Status do Git |
| `<Space>gd` | Abre divisão de tela mostrando as diferenças (Git Diff) |
| `<Space>gb` | Executa o Git Blame na linha atual |
| `]c` / `[c` | Pula para a próxima / anterior alteração no arquivo |
| `<Space>ghp`| Pré-visualiza as alterações do bloco sob o cursor |

### 🤖 Inteligência Artificial
| Atalho | Ação |
| :--- | :--- |
| `Ctrl + g` (Modo Insert) | Aceitar a sugestão do autocompletar (`Codeium`) |
| `Ctrl + f` (Modo Insert) | Ver próxima sugestão do autocompletar (`Codeium`) |
| `Ctrl + d` (Modo Insert) | Ver sugestão anterior do autocompletar (`Codeium`) |
| `Ctrl + x` (Modo Insert) | Limpar sugestão do autocompletar (`Codeium`) |
| `<Space>ac` | Abre / continua um chat com a IA (`vim-ai`) |
| `<Space>ai` | Abre linha de comando para gerar código/texto (`vim-ai`) |
| `<Space>ae` | Abre linha de comando para editar/refatorar código (`vim-ai`) |
| `<Space>ar` | Refaz a última solicitação feita para a IA |

#### 🔑 Autenticação dos Assistentes de IA

1. **Codeium (Autocompletar)**:
   - Digite o comando `:Codeium Auth` no Vim.
   - O seu navegador abrirá automaticamente. Crie sua conta gratuita ou faça login.
   - Copie o token de autenticação gerado na página do Codeium.
   - Volte ao Vim, cole o token na linha de comando e dê Enter.

2. **vim-ai (Geração, Edição e Chat)**:
   - O `vim-ai` necessita de uma chave da API da OpenAI.
   - Defina a variável de ambiente `OPENAI_API_KEY` (por exemplo, exportando-a no seu `.bashrc` ou `.zshrc`):
     ```bash
     export OPENAI_API_KEY="sua-chave-api-aqui"
     ```
   - Alternativamente, salve a chave diretamente em um arquivo de texto simples no caminho `~/.config/openai.token`.

### 💻 LSP (Language Server Protocol - CoC.nvim)

O autocompletar inteligente, validação de erros e navegação de código (LSP) são gerenciados pelo **CoC.nvim**.

#### 📦 Instalação dos servidores de linguagem (LSP)
Para ativar o suporte a cada linguagem, abra o Vim e execute o comando abaixo correspondente à linguagem ou framework que você deseja:

*   **JavaScript, TypeScript e React**: `:CocInstall coc-tsserver`
*   **PHP**: `:CocInstall coc-phpls`
*   **Vue**: `:CocInstall @yaegassy/coc-volar`
*   **Java**: `:CocInstall coc-java`

*Dica: Você pode instalar todos de uma vez rodando no Vim:*
`:CocInstall coc-tsserver coc-phpls @yaegassy/coc-volar coc-java`

#### ⌨️ Atalhos de Navegação de Código (LSP)
| Atalho | Ação |
| :--- | :--- |
| `gd` | Ir para a Definição (Go to Definition) do item sob o cursor |
| `gy` | Ir para a Definição do Tipo (Type Definition) |
| `gi` | Ir para a Implementação (Go to Implementation) |
| `gr` | Listar todas as Referências do item (Go to References) |
| `K` | Mostrar documentação/assinatura da função em uma janela flutuante |
| `[g` / `]g` | Pular para o erro/alerta anterior / seguinte no arquivo |
| `Tab` (Modo Insert) | Navegar para baixo no menu de autocompletar do CoC |
| `Shift + Tab` | Navegar para cima no menu de autocompletar do CoC |


### 🖥️ Terminal Integrado (nativo do Vim)
O Vim 9 já traz terminal embutido — não precisa de plugin.

| Comando | Ação |
| :--- | :--- |
| `:terminal` | Abre um terminal em divisão horizontal (embaixo) |
| `:vert terminal` | Abre um terminal em divisão vertical (lateral) |
| `:tab terminal` | Abre um terminal em uma **aba nova** |
| `:terminal lazydocker` | Abre o painel gerenciador do Docker no terminal do Vim |

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
