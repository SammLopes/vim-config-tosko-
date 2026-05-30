# Fluxo de Trabalho para Atualizar a Documentação (README.md)

## Objetivo
Guiar o agente ou desenvolvedor a manter a documentação do projeto sincronizada sempre que houver mudanças na configuração ou na lista de plugins.

## Passos
1. **Abrir `README.md`** no editor.
2. **Localizar a seção "Plugins"** (ou criar se não existir).
3. **Adicionar uma nova linha** com o nome do plugin e uma breve descrição, por exemplo:
   ```markdown
   - **NERDTree** – Navegação em árvore de diretórios, facilita a exploração de arquivos.
   ```
4. **Atualizar qualquer outra seção** que seja impactada (por exemplo, requisitos de dependência ou instruções de instalação).
5. **Commitar a alteração** com mensagem clara, ex.: `docs: atualizar README com novo plugin NERDTree`.
6. **Opcional:** gerar um changelog ou atualizar o arquivo `CHANGELOG.md` se o projeto o possuir.

## Boas Práticas
- Use linguagem clara e concisa.
- Mantenha links para a página oficial do plugin quando disponíveis.
- Separe plugins essenciais dos opcionais usando subtítulos ou marcadores.
- Verifique a formatação Markdown (listas, negrito, links) com um visualizador antes de commitar.
