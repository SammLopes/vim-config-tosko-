# Fluxo de Trabalho para Validar a Configuração do Vim

## Objetivo
Garantir que o `vimrc` continue carregando sem erros após qualquer alteração
(novos plugins, mapeamentos, funções) antes de commitar.

## Passos
1. **Validar a sintaxe do `vimrc`** em modo silencioso (não abre a UI; erros vão
   para o stderr):
   ```bash
   vim -es -u vimrc -c "q"
   ```
   - Saída vazia e código de retorno `0` = sintaxe OK.
   - Qualquer mensagem de erro indica problema a corrigir antes de seguir.
2. **Recarregar dentro de uma sessão real** para testar o comportamento:
   ```vim
   :source $MYVIMRC
   ```
3. **Instalar/atualizar plugins** quando a lista `Plug` tiver mudado:
   ```vim
   :PlugInstall
   :PlugUpdate
   :PlugClean
   ```
4. **Testar manualmente os atalhos afetados** (ver `.agents/manual.md`), por
   exemplo `<Space>e` (NERDTree), `<Space>ff` (FZF), `<Space>gs` (Fugitive).
5. **Trocar de tema** (F5–F9) para confirmar que as cores do GitGutter persistem
   via `augroup GitGutterColors`.

## Boas Práticas
- Rode a validação de sintaxe sempre que editar o `vimrc`, mesmo em mudanças pequenas.
- Lembre que o carregamento de plugins é condicional (`if s:plug_exist`): se o
  `plug.vim` não for encontrado, os plugins e suas configs simplesmente não carregam,
  sem erro — confirme que a mensagem "Vim-Plug não encontrado" não aparece.
- Valide em Linux e, quando possível, em Windows, já que `SetPlug()` resolve caminhos
  diferentes por plataforma.
