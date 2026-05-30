# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Visão geral

Configuração pessoal do Vim/Neovim ("Tosko Vim"), inspirada no LazyVim. Todo o
comportamento vive em um único arquivo `vimrc` (VimScript). Não há build, lint nem
suíte de testes — a "instalação" são links simbólicos e a "validação" é checar a
sintaxe do `vimrc` e instalar plugins dentro do próprio Vim.

## Comandos

```bash
# Instalar (cria os symlinks ~/.vimrc e ~/.vim/autoload -> este repo)
./setup.sh                 # Linux/macOS
setup.bat                  # Windows (cria %USERPROFILE%\_vimrc e .vim\autoload)

# Validar a sintaxe do vimrc após editá-lo (sai sem abrir UI; erros vão para stderr)
vim -es -u vimrc -c "q"
```

Dentro do Vim:
- `:PlugInstall` — instalar plugins recém-adicionados ao bloco `plug#begin`
- `:PlugUpdate` / `:PlugClean` — atualizar / remover plugins órfãos
- `:source $MYVIMRC` — recarregar a config sem reiniciar

## Consulte `.agents/` antes de agir

A pasta `.agents/` contém documentação versionada que **deve ser lida para obter mais
contexto** antes de mexer na config. Use-a como fonte de verdade complementar a
este arquivo:

- `.agents/manual.md` — **referência completa** de todos os atalhos (leader, NERDTree,
  Git/Fugitive, GitGutter, FZF, Markdown) com explicações. Consulte antes de
  documentar ou alterar mapeamentos.
- `.agents/plugin_addition.md` — passo a passo oficial para adicionar um plugin.
  Siga-o ao incluir qualquer `Plug`.
- `.agents/documentation_workflow.md` — como manter o `README.md` sincronizado.
- `.agents/testing_workflow.md` — como validar o `vimrc` (sintaxe, reload, plugins).
- `.agents/overview.md` — índice dos agentes/fluxos.

Ao seguir esses fluxos, mantenha `.agents/` e `README.md` coerentes com as mudanças
feitas no `vimrc`.

## Arquitetura do `vimrc`

O arquivo é organizado em blocos rotulados por comentários (`" ===`). A parte não
óbvia é o carregamento de plugins, que é **multiplataforma e condicional**:

- A função `SetPlug()` resolve onde está o vim-plug e a pasta `plugged/`:
  - **Windows**: `$USERPROFILE/vimfiles/autoload/plug.vim` e `.../vimfiles/plugged`
  - **Linux/macOS**: resolve `$MYVIMRC` (seguindo o symlink), pega o diretório do
    repo e usa `<repo>/autoload/plug.vim` e `<repo>/plugged`
- Só chama `plug#begin`/`plug#end` se o `plug.vim` existir (`s:plug_exist`). Se
  você editar a lista de plugins, ela está **dentro deste `if`** — não no topo do arquivo.
- Toda a configuração de plugins (NERDTree, airline, cores do GitGutter) também
  vive dentro desse mesmo bloco `if s:plug_exist`.

Autopairs é implementação própria (não usa plugin): `AutoPairsInsert()` +
`AutoPairsCloseChar()` com mapeamentos `inoremap <expr>` para `( [ { " '`. A lógica
de aspas conta ocorrências na linha para decidir abrir/fechar.

`mapleader` é `<Espaço>`. As referências de atalhos ficam em comentários no fim do
`vimrc` e, de forma mais completa, em `.agents/manual.md` (aberto com `<Space>m`).

## Convenções importantes

- **`plugged/` é gitignored** (plugins baixados pelo vim-plug). A pasta `.agents/` é
  **versionada** e contém a documentação de contexto (manual, fluxos) — mantenha-a
  coerente com as mudanças no `vimrc`.
- Ao **adicionar um plugin**: insira `Plug '<repo>'` antes de `call plug#end()`,
  rode `:PlugInstall`, valide com `vim -es -u vimrc -c "q"` e **atualize o
  `README.md`** (seção de recursos) e `.agents/manual.md` se houver atalho novo.
  Use commit `feat: ...`; mudanças só de doc usam `docs: ...`.
- **Temas** trocáveis em runtime: F5 nord, F6 dracula, F7 molokai, F8 gruvbox,
  F9 desert; padrão `colorscheme onedark`. As cores do GitGutter são re-aplicadas
  via `augroup GitGutterColors` em todo `ColorScheme` para sobreviverem à troca.
- Há uma pasta `autoload/autoload/` aninhada (não rastreada) — duplicata acidental;
  o `plug.vim` correto é `autoload/plug.vim`.
- Mensagens de commit e documentação do projeto estão em **português**.
