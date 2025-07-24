" Vim-Plug

if has('win32') || has('win64')
	let s:plug_dir = expand('$USERPROFILE/vimfiles/plugged')
else
	let s:config_dir = fnamemodify(resolve( expand('<sfile>:p')), ':h')
    let s:plug_dir	 = s:config_dir.'/plugged'

endif

" Configure o diretório de plugins, se desejar
call plug#begin(s:plug_dir)

    " Adicione plugins aqui

    " Plugins
    " NERDTree
    Plug 'preservim/nerdtree'
    Plug 'ObserverOfTime/coloresque.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'TaDaa/vimade'
    Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }

    " Temas
    Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'tomasr/molokai'

" Encerre a declaração do Vim-Plug
call plug#end()


" Temas de cores 

syntax on

set termguicolors
colorscheme onedark
let mapleader = " "

nnoremap <F5>:colorscheme nord   <CR> " F5
nnoremap <F6>:colorscheme dracula<CR> " F6
nnoremap <F7>:colorscheme molokai<CR> " F7
nnoremap <F8>:colorscheme gruvbox<CR> " F8
nnoremap <F9>:colorscheme desert <CR> " F9

" Atalho NERDTree
"Tecla	Ação
"o	Abrir arquivo ou diretório
"m	Mostrar menu (criar, mover...)
"a	Criar arquivo
"A	Criar diretório
"d	Deletar
"r	Renomear
"C	Tornar diretório raiz
"u	Subir um nível
"q	Fechar o NERDTree
nnoremap <Leader>e :NERDTreeToggle <CR>
nnoremap <Leader>n :bn<CR> "Proximo Buffer
nnoremap <Leader>p :bp<CR>  "Buffer anterior
nnoremap <Leader>x :bd<CR> "Deletar buffer atual  
nnoremap <Leader>h <C-w>h " Alterar para o NerdTree
nnoremap <Leader>l <C-w>l " Alterar para buffer a direita
nnoremap <Leader>w <C-w>w " Alterar entre ajnelas abertas dos buffers
" NERDTree Navegação
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <Leader>r :NERDTreeFind<CR>
nnoremap <Leader>R :NERDTreeRefreshRoot<CR>


" Refazer -> CTRL + R 
" Desfazer -> u
" Identação -> TAB
" Identação a direita no modo VISUAL -> V -> CTRL > Pode ser usada em blocos
" Identação a esquerda no modo VISUAL -> V -> CTRL < Pode ser usada em blocos
"

set number
set relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab



























