" ==============================
" CONFIGURAÇÕES BÁSICAS
" ==============================

let g:coloresque_whitelist = ['php']
let g:coloresque_blacklist = []

set number
set relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set linespace=8

" configs airline

let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '│'

let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1

set hidden


if has('termguicolors')
    set termguicolors
endif

if &term =~ 'xterm'
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
    let &t_SR = "\e[4 q"
endif

syntax on

" ==============================
" LEADER
" ==============================

let mapleader = " "
nnoremap <Space> <Nop>

" ==============================
" AUTOPAIRS
" ==============================

function! AutoPairsCloseChar(open)
    return get({
        \ '(' : ')',
        \ '[' : ']',
        \ '{' : '}',
        \ '"' : '"',
        \ "'" : "'"
    \ }, a:open, '')
endfunction

function! AutoPairsInsert(char)
    let line = getline('.')
    let coln = col('.')

    if coln <= len(line) && line[coln - 1] == a:char
        return "\<Right>"
    endif

    let context = coln > 2 ? line[0 : coln - 2] : ''
    let quoteCount = len(split(context, escape(a:char, '[]\.^$*'), 1)) - 1

    if a:char == '"' || a:char == "'"
        if quoteCount % 2 == 1
            return a:char
        endif
    endif

    return a:char . AutoPairsCloseChar(a:char)
endfunction

inoremap <expr> ( AutoPairsInsert('(')
inoremap <expr> [ AutoPairsInsert('[')
inoremap <expr> { AutoPairsInsert('{')
inoremap <expr> " AutoPairsInsert('"')
inoremap <expr> ' AutoPairsInsert("'")

" ==============================
" VIM-PLUG
" ==============================

let s:config_dir = fnamemodify(resolve(expand('<sfile>')), ':h')

function! SetPlug() abort

    if has('win32') || has('win64')

        let s:vim_plug_path = expand('$USERPROFILE/vimfiles/autoload/plug.vim')

        if filereadable(s:vim_plug_path)
            let s:plug_dir = expand('$USERPROFILE/vimfiles/plugged')
            let s:plug_exist = v:true
        else
            echo "Vim-Plug Windows não encontrado: " . s:vim_plug_path
        endif

    else

        let s:vim_plug_path = s:config_dir . '/autoload/plug.vim'

        if filereadable(s:vim_plug_path)
            let s:plug_dir = s:config_dir . '/plugged'
            let s:plug_exist = v:true
        else
            echo "Vim-Plug Linux não encontrado: " . s:vim_plug_path
        endif

    endif

endfunction

let s:plug_exist = v:false
let s:plug_dir = ''

call SetPlug()

if s:plug_exist

    call plug#begin(s:plug_dir)

    " Plugins
    Plug 'preservim/nerdtree'
    Plug 'ObserverOfTime/coloresque.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'TaDaa/vimade'
    Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
    Plug 'mhinz/vim-startify'
    Plug 'Yggdroot/indentLine'

    " Temas
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'tomasr/molokai'
    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    " Busca rápida (FZF)
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Ícones (Deve ser carregado por último)
    Plug 'ryanoasis/vim-devicons'


    call plug#end()

    let g:NERDTreeShowHidden = 1
    let g:NERDTreeIgnore = []

    " Configurações do Vim-Airline (Mostrar buffers como abas no topo)
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail' " Mostra apenas o nome do arquivo (sem caminho longo)
    let g:airline#extensions#tabline#buffer_nr_show = 1       " Mostra o número do buffer ao lado do nome
    let g:airline_theme = 'onedark'                            " Combina as cores do statusbar/abas com o tema OneDark

    " Personalização de Cores do GitGutter (Sinalizadores na barra lateral)
    " Define o fundo transparente para a coluna de sinais
    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight GitGutterAdd guifg=#98c379 guibg=NONE ctermfg=2
    highlight GitGutterChange guifg=#e5c07b guibg=NONE ctermfg=3
    highlight GitGutterDelete guifg=#e06c75 guibg=NONE ctermfg=1

    " Garante que as cores do GitGutter persistam se você trocar de tema (F5-F9)
    augroup GitGutterColors
        autocmd!
        autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
        autocmd ColorScheme * highlight GitGutterAdd guifg=#98c379 guibg=NONE ctermfg=2
        autocmd ColorScheme * highlight GitGutterChange guifg=#e5c07b guibg=NONE ctermfg=3
        autocmd ColorScheme * highlight GitGutterDelete guifg=#e06c75 guibg=NONE ctermfg=1
    augroup END




else

    echo "Vim-Plug não encontrado"

endif

" ==============================
" CUSTOMIZAÇÃO ESTILO LAZYVIM
" ==============================

" 1. Customização do Vim-Startify (Tela de Início)
let g:startify_custom_header = [
    \ '   ████████╗ ██████╗  ██████╗██╗  ██╗ ██████╗     ██╗   ██╗██╗███╗   ███╗',
    \ '   ╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝██╔═══██╗    ██║   ██║██║████╗ ████║',
    \ '      ██║   ██║   ██║╚█████╗ █████╔╝ ██║   ██║    ██║   ██║██║██╔████╔██║',
    \ '      ██║   ██║   ██║ ╚═══██╗██╔═██╗ ██║   ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '      ██║   ╚██████╔╝██████╔╝██║  ██╗╚██████╔╝     ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '      ╚═╝    ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝       ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ '',
    \ '                         [ Edição Suprema: Tosko Vim ]',
    \ ]

" Atalhos e listas da tela de início
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Arquivos Recentes']            },
    \ { 'type': 'dir',       'header': ['   Diretório Atual: '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['   Favoritos']                    },
    \ ]

" Favoritos personalizados
let g:startify_bookmarks = [
    \ { 'v': s:config_dir . '/vimrc' },
    \ { 'm': s:config_dir . '/.agents/manual.md' },
    \ ]

let g:startify_custom_header_to_center = 1

" 2. Ícones (vim-devicons)
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" 3. Guias de Indentação (indentLine)
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#3e4452'

" ==============================
" TEMA
" ==============================

colorscheme onedark

" ==============================
" ATALHOS
" ==============================

" NERDTree
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>r :NERDTreeFind<CR>
nnoremap <silent> <Leader>R :NERDTreeRefreshRoot<CR>

" Buffers
nnoremap <silent> <Leader>n :bnext<CR>
nnoremap <silent> <Leader>p :bprevious<CR>
nnoremap <silent> <Leader>x :bdelete<CR>
nnoremap <silent> <S-l> :bnext<CR>
nnoremap <silent> <S-h> :bprevious<CR>
nnoremap <silent> <S-d> :bdelete<CR>

" Navegação entre janelas
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>l <C-w>l
nnoremap <silent> <Leader>w <C-w>w

" Ajuda Vim
nnoremap <silent> <Leader>k :help <C-R>=expand("<cword>")<CR><CR>

" Manual personalizado
execute "nnoremap <silent> <Leader>m :e " . fnameescape(s:config_dir . "/.agents/manual.md") . "<CR>"
nnoremap <silent> <Leader>mp :MarkdownPreview<CR> " <Space>mp - abrir preview de Markdown no navegador
nnoremap <silent> <Leader>mt :vertical terminal glow %<CR> " <Space>mt - abrir preview de Markdown no terminal usando o glow

" FZF (Busca rápida de arquivos e textos)
nnoremap <silent> <Leader>ff :Files<CR> " <Space>ff - Buscar arquivos pelo nome
nnoremap <silent> <Leader>fg :Rg<CR> " <Space>fg - Buscar texto dentro dos arquivos (Ctrl+F global)
nnoremap <silent> <Leader>fb :Buffers<CR> " <Space>fb - Buscar arquivos abertos recentemente (buffers)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }



" Git (Fugitive & GitGutter)
nnoremap <silent> <Leader>gs :Git<CR>
nnoremap <silent> <Leader>gd :Gdiffsplit<CR>
nnoremap <silent> <Leader>gb :Git blame<CR>
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>ghp :GitGutterPreviewHunk<CR>
nnoremap <silent> <Leader>ghs :GitGutterStageHunk<CR>
nnoremap <silent> <Leader>ghu :GitGutterUndoHunk<CR>
nmap <silent> ]c <Plug>(GitGutterNextHunk)
nmap <silent> [c <Plug>(GitGutterPrevHunk)

" Temas
nnoremap <F5> :colorscheme nord<CR>
nnoremap <F6> :colorscheme dracula<CR>
nnoremap <F7> :colorscheme molokai<CR>
nnoremap <F8> :colorscheme gruvbox<CR>
nnoremap <F9> :colorscheme desert<CR>

" ==============================
" REFERÊNCIA NERDTREE
" ==============================

" o  Abrir arquivo ou diretório
" m  Mostrar menu
" a  Criar arquivo
" A  Criar diretório
" d  Deletar
" r  Renomear
" C  Tornar diretório raiz
" u  Subir um nível
" q  Fechar o NERDTree

" ==============================
" REFERÊNCIA GERAL
" ==============================

" Refazer       -> CTRL + R
" Desfazer      -> u
" Indentação    -> TAB
" Visual >      -> Indentar à direita
" Visual <      -> Indentar à esquerda

nnoremap <Leader>? :echo "e=NERDTreeToggle <Bar> r=NERDTreeFind <Bar> n=NextBuffer <Bar> p=PrevBuffer <Bar> x=DeleteBuffer <Bar> h=LeftWindow <Bar> l=RightWindow <Bar> w=SwitchWindow"<CR>