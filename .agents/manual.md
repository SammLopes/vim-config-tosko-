# Manual de Comandos Personalizados para a Configuração do Vim

## Mapeamentos de Teclas Rápidas

- `<Space>e` – `:NERDTreeToggle` – Abre/fecha a barra lateral do NERDTree.
- `<Space>r` – `:NERDTreeFind` – Busca e localiza o arquivo atual na árvore do NERDTree.
- `<Space>R` – `:NERDTreeRefreshRoot` – Atualiza a árvore a partir do diretório raiz.
- `<Space>n` – `:bnext` – Vai para a próxima aba/buffer no topo.
- `<Space>p` – `:bprevious` – Volta para a aba/buffer anterior no topo.
- `<Space>x` – `:bdelete` – Fecha a aba/buffer atual.
- `:<número>` – (Ex: `:b3`) – Ir diretamente para o buffer/aba de número 3 (exibido na aba).
- `<Space>h` – Move o foco para a janela da esquerda (ex: voltar para o NERDTree).
- `<Space>l` – Move o foco para a janela da direita (ex: ir para o buffer de edição).
- `<Space>w` – Alterna o foco entre janelas abertas.
- `<Space>k` – `:help` – Abre a ajuda oficial do Vim para a palavra sob o cursor.
- `<Space>m` – Abre este manual personalizado.
- `<Space>mp` – `:MarkdownPreview` – Abre uma aba no navegador com a visualização do Markdown renderizado em tempo real.
- `<Space>mt` – `:vertical terminal glow %` – Abre o preview do Markdown diretamente no terminal do Vim usando a ferramenta `glow`.
- `<Space>ff` – `:Files` – Abre o buscador rápido de arquivos (FZF) para encontrar arquivos pelo nome.
- `<Space>fg` – `:Rg` – Abre o buscador global de texto (Ctrl+F) usando o `ripgrep`.
- `<Space>fb` – `:Buffers` – Abre a lista de buffers (arquivos abertos recentemente na sessão) para alternar rapidamente.

### Comandos de Git (Fugitive & GitGutter)
- `<Space>gs` – `:Git` – Abre a janela interativa de status do Git.
- `<Space>gd` – `:Gdiffsplit` – Abre o editor de diffs do arquivo atual.
- `<Space>gb` – `:Git blame` – Mostra quem alterou cada linha do arquivo.
- `<Space>gp` – `:Git push` – Envia as alterações para o repositório remoto.
- `]c` – Pula para a próxima alteração no arquivo (GitGutter).
- `[c` – Pula para a alteração anterior no arquivo (GitGutter).
- `<Space>ghp` – `:GitGutterPreviewHunk` – Mostra o diff do bloco alterado sob o cursor.
- `<Space>ghs` – `:GitGutterStageHunk` – Adiciona o bloco de alteração atual ao Git (stage).
- `<Space>ghu` – `:GitGutterUndoHunk` – Desfaz (reverte) a alteração do bloco sob o cursor.


---

## Manipulando Arquivos e Navegando no NERDTree (Aba Lateral)

Quando estiver com o foco na barra lateral do NERDTree (use `<Space>h` para focar nela se necessário):

### 1. Navegação de Diretórios
- **`o` ou `Enter`** – Abre/fecha pastas ou abre um arquivo (se usado em `.. (up a dir)`, sobe de nível).
- **`u` (Minúsculo)** – Sobe um nível na árvore de diretórios (vai para a pasta pai).
- **`C` (Maiúsculo / Shift + C)** – Torna a pasta selecionada a nova raiz do NERDTree.
  - *Atenção*: Não use `c` minúsculo, pois ele é um comando do Vim para editar texto e dará o erro `modifiable is off`.
- **`q`** – Fecha a barra lateral do NERDTree.

### 2. Menu de Arquivos (Criar, Deletar, Renomear e Copiar)
Pressione a tecla **`m`** com o cursor posicionado sobre qualquer arquivo ou pasta. Um menu aparecerá na parte inferior da tela com as seguintes opções:

- **`a` (Add)** – Cria um novo arquivo ou diretório.
  - *Dica*: Para criar um diretório, digite o nome terminando com barra `/` (ex: `nova-pasta/`). Para arquivos, digite normalmente (ex: `index.js`).
- **`d` (Delete)** – Exclui o arquivo ou pasta selecionada.
- **`m` (Move/Rename)** – Move ou renomeia o arquivo/pasta.
  - *Dica*: Modifique o final do caminho para renomear, ou altere o caminho completo para mover para outro diretório.
- **`c` (Copy)** – Copia o arquivo/pasta para um novo local.

### 3. Localizar Arquivo Aberto
- Estando em qualquer arquivo que você está editando, pressione **`<Space>r`** (NERDTreeFind). O Vim focará no NERDTree e destacará a linha exata onde esse arquivo está localizado.

---

## Gerenciamento de Git (Fugitive & GitGutter)

### 1. Painel de Status Interativo (`<Space>gs`)
Ao pressionar **`Espaço gs`**, abre-se o painel do status do Git:
- Mova o cursor sobre um arquivo e pressione **`s`** para dar Stage (`git add`).
- Mova o cursor sobre um arquivo e pressione **`u`** para dar Unstage (`git reset`).
- Pressione **`cc`** para escrever a mensagem e fazer o Commit.
- Pressione **`g?`** para ver todas as opções de teclas de atalho desse painel.

### 2. Diffs e Resolução de Conflitos (`<Space>gd`)
Com o arquivo aberto, pressione **`Espaço gd`** para dividir a tela e ver todas as alterações feitas em tempo real em comparação com o repositório.

### 3. Navegação rápida por alterações no arquivo (`]c` e `[c`)
- **`]c`** pula para a próxima mudança no seu arquivo atual.
- **`[c`** pula para a mudança anterior.
- Digite **`Espaço ghp`** para ver o balão flutuante com a alteração exata.
- Digite **`Espaço ghs`** para salvar (stage) apenas aquele pedacinho da alteração.
- Digite **`Espaço ghu`** para desfazer (reverter) apenas aquela alteração específica.

---

## Visualização de Markdown (`<Space>mp`)

O plugin **`markdown-preview.nvim`** permite renderizar e ler seus arquivos `.md` (como este manual) formatados diretamente no seu navegador em tempo real:
- Com qualquer arquivo `.md` aberto, pressione **`Espaço mp`**.
- Uma página da web será aberta automaticamente, mostrando o arquivo estilizado (com títulos, listas, tabelas e links).
- A página se atualiza instantaneamente conforme você digita no Vim, e o scroll do navegador acompanha o movimento do cursor.
- Para encerrar o preview, basta fechar a aba do navegador ou rodar o comando `:MarkdownPreviewStop` no Vim.

### 2. Leitura Direta no Terminal com Glow (`<Space>mt`)
Se você preferir ler o Markdown formatado diretamente de dentro do Vim sem abrir o navegador:
- Certifique-se de que a ferramenta **`glow`** está instalada no seu Linux (`sudo snap install glow` ou pelo gerenciador de pacotes).
- Com o arquivo `.md` aberto, pressione **`Espaço mt`**.
- O Vim abrirá uma janela de terminal lateral executando o `glow` no arquivo atual.
- Para fechar essa janela lateral, basta focar nela (`Espaço h/l`) e pressionar **`q`** para sair do `glow`, seguido de qualquer tecla para fechar o terminal do Vim.


---

## Atalhos Gerais do Vim
- **`Ctrl + R`** – Refazer (Redo)
- **`u`** – Desfazer (Undo)
- **`TAB`** – Indentar o código
- No modo Visual (**`V`**):
  - **`>`** – Indentar bloco de código selecionado para a direita.
  - **`<`** – Indentar bloco de código selecionado para a esquerda.
