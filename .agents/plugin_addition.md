# Fluxo de Trabalho para Adicionar um Plugin ao vimrc

## Objetivo
Orientar o agente (ou desenvolvedor) a incluir um novo plugin de forma consistente, documentando a mudança e garantindo que a configuração continue funcional.

## Passos
1. **Abrir `vimrc`** e localizar o bloco `call plug#begin(...)`.
2. **Inserir a linha** `Plug '<repo>/<plugin>'` logo antes de `call plug#end()`.
3. **Atualizar o README.md**:
   - Adicionar o nome do plugin na seção "Plugins".
   - Breve descrição do motivo da inclusão.
4. **Instalar o plugin** dentro do Vim:
   ```vim
   :PlugInstall
   ```
5. **Validar a sintaxe** do `vimrc`:
   ```bash
   vim -es -u vimrc -c "q"
   ```
6. **Commitar a mudança** com mensagem clara, ex.: `feat: adicionar plugin NERDTree`.

## Boas Práticas
- Sempre verificar se o plugin tem dependências adicionais.
- Preferir plugins mantidos ativamente e compatíveis com ambas as plataformas (Linux/Windows).
- Manter as linhas de configuração simples e comentadas quando necessário.
