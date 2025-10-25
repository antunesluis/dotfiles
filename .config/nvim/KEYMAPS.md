# Neovim Keymaps - Cheat Sheet

**Leader Key:** `<Space>`

---

## File Navigation & Management

### Oil (File Explorer)

- `-` → Abrir diretório pai na janela atual
- `<leader>-` → Abrir diretório pai em janela flutuante
- `q` → Fechar Oil
- `Alt+h` → Abrir em split horizontal

### Snacks Picker (Fuzzy Finder)

- `<leader>pf` → Buscar arquivos
- `<leader>pc` → Buscar arquivos de config do Neovim
- `<leader>pr` → Arquivos recentes (Telescope)
- `<leader>ps` → Grep (buscar texto em arquivos)
- `<leader>pws` → Buscar palavra sob cursor / seleção visual
- `<leader>pk` → Buscar keymaps
- `<leader>pt` → Buscar TODO comments
- `<leader>pT` → Buscar TODO/FIX/FIXME

### Explorer

- `<leader>es` → Abrir Snacks Explorer

---

## Buffer Management

- `<leader>bb` → Ir para buffer anterior
- `<leader>bp` → Próximo buffer
- `\\` → Listar todos os buffers
- `<leader>bd` → Deletar buffer atual
- `<leader>bD` → Deletar todos os buffers
- `<leader>dB` → Deletar buffer (com confirmação)

---

## Splits & Tabs

### Splits

- `<leader>sv` → Split vertical
- `<leader>sh` → Split horizontal
- `<leader>se` → Igualar tamanho dos splits
- `<leader>sx` → Fechar split atual

### Tabs

- `<leader>to` → Abrir nova tab
- `<leader>tx` → Fechar tab atual
- `<leader>tn` → Próxima tab
- `<leader>tp` → Tab anterior
- `<leader>tf` → Abrir arquivo atual em nova tab

---

## Edição de Texto

### Movimentação de Linhas

- `J` (visual) → Mover linhas para baixo
- `K` (visual) → Mover linhas para cima
- `J` (normal) → Juntar linhas mantendo cursor

### Indentação

- `<` (visual) → Indentar para esquerda (mantém seleção)
- `>` (visual) → Indentar para direita (mantém seleção)

### Clipboard & Yank

- `<leader>y` → Copiar para clipboard do sistema
- `<leader>Y` → Copiar linha para clipboard do sistema
- `<leader>p` (visual) → Colar sem yankar texto deletado
- `<leader>P` (visual) → Colar sem afetar clipboard
- `<leader>d` → Deletar sem yankar
- `x` → Deletar caractere sem yankar

### Busca e Substituição

- `n` → Próximo resultado (centralizado)
- `N` → Resultado anterior (centralizado)
- `Ctrl+c` (normal) → Limpar highlight de busca
- `<leader>s` → Substituir palavra sob cursor globalmente

---

## Aparência & Temas

- `<leader>th` → Seletor de temas (Snacks)
- `<leader>ths` → Theme Switcher (Telescope)
- `<leader>cw` → Remover whitespace no arquivo

---

## LSP & Diagnósticos

### Navegação e Referências

- `gR` → Mostrar referências LSP (Telescope)
- `gD` → Ir para declaração
- `gd` → Mostrar definições LSP (Telescope)
- `gi` → Mostrar implementações LSP (Telescope)
- `gt` → Mostrar definições de tipo LSP (Telescope)
- `K` → Mostrar documentação (hover)

### Code Actions & Refactoring

- `<leader>vca` → Ver ações de código disponíveis
- `<leader>rn` → Renomear símbolo (smart rename)
- `<leader>rN` → Renomear arquivo atual (rápido)

### Diagnósticos

- `<leader>D` → Mostrar diagnósticos do buffer (Telescope)
- `<leader>d` → Mostrar diagnósticos da linha
- `<leader>lx` → Toggle visibilidade diagnósticos LSP

### Formatação

- `<leader>f` → Formatar arquivo com LSP
- `<leader>mp` → Formatar arquivo/seleção com Conform

### Linting

- `<leader>l` → Executar linting no arquivo atual

### Utilitários LSP

- `<leader>rs` → Reiniciar LSP
- `Ctrl+h` (insert) → Mostrar signature help

### Trouble (Diagnósticos)

- `<leader>xw` → Diagnósticos do workspace
- `<leader>xd` → Diagnósticos do documento
- `<leader>xx` → Lista quickfix
- `<leader>xX` → Lista de locations
- `<leader>xt` → Abrir TODOs no Trouble

---

## TODO Comments

- `]t` → Próximo TODO comment
- `[t` → TODO comment anterior

**Tags suportadas:** `TODO`, `FIX`, `FIXME`, `BUG`, `HACK`, `WARN`, `PERF`, `NOTE`, `TEST`, `FORGETNOT`

---

## Git

- `<leader>lg` → Abrir LazyGit
- `<leader>gl` → LazyGit Logs
- `<leader>gbr` → Selecionar e trocar branch

---

## Sessões (Auto-Session)

- `<leader>wr` → Restaurar sessão do diretório atual
- `<leader>ws` → Salvar sessão do diretório atual

---

## Utilitários

- `<leader>u` → Toggle Undotree
- `<leader>fp` → Copiar caminho do arquivo para clipboard
- `<leader>vh` → Páginas de ajuda do Vim
- `Ctrl+c` (insert) → Alternativa para ESC
- `Q` → Desabilitado (noop)

---

## Autocompletion (nvim-cmp)

### Navegação

- `Tab` → Próximo item / Expandir snippet / Completar
- `Shift+Tab` → Item anterior / Voltar no snippet
- `Ctrl+j` / `Ctrl+n` / `Down` → Próximo item
- `Ctrl+k` / `Ctrl+p` / `Up` → Item anterior

### Ações

- `Ctrl+y` → Confirmar seleção
- `Ctrl+e` → Fechar janela de completação
- `Ctrl+f` → Scroll documentação para baixo
- `Ctrl+b` → Scroll documentação para cima
- `Ctrl+d` → Fechar documentação

---

## GitHub Copilot

- `Alt+]` → Próxima sugestão do Copilot
- `Alt+[` → Sugestão anterior do Copilot

**Nota:** Aceitar sugestões é feito através do nvim-cmp com `Tab` ou `Ctrl+y`

---

## Mini.nvim Plugins

### Surround (mini.surround)

- `sa` → Add surrounding (normal/visual)
- `ds` → Delete surrounding
- `sr` → Replace surrounding
- `sf` / `sF` → Find surrounding (direita/esquerda)
- `sh` → Highlight surrounding
- `sn` → Update n_lines

**Exemplos:**

- `sa"` → Envolve palavra com aspas
- `ds"` → Remove aspas ao redor
- `sr"'` → Troca aspas duplas por simples

### Comentários (mini.comment)

- `gc` → Toggle comment (normal/visual)
- `gcc` → Toggle comment na linha atual

**Suporte especial para:** JSX, TSX, HTML, Svelte (comentários contextuais)
