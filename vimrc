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

if &term =~ 'xterm'
    let &t_SI = "\e[6 q" "Start Insert
    let &t_EI = "\e[2 q" "End Insert
    let &t_SR = "\e[4 q" "Start Replace
endif

" =====================
" Autocomplete        |
" =====================
func! AutoPairsInsert(char)
    let line = getline('.')
    let col = col('.')
    
    if col <= len(line) && line[col -1] == a:char
        return "\<Right>"
    end
    let context = col > 2 ? line[0 : col - 2] : ''  
    let quoteCount = len(split(context, a:char)) - 1
    
    if a:char == '"' || a:char == "'"
       if quoteCount % 2 == 1
        return a:char
       end 
    end
    
    return a:char . AutoPairsCloseChar(a:char)
endf

func! AutoPairsCloseChar(open)
    return get({ '(':')', '[':']', '{':'}', '"':'"', "'":"'" }, a:open, '')
endf

inoremap <expr> ( AutoPairsInsert('(')
inoremap <expr> [ AutoPairsInsert('[')
inoremap <expr> { AutoPairsInsert('{')
inoremap <expr> " AutoPairsInsert('"')
inoremap <expr> ' AutoPairsInsert("'")

"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"inoremap ''" ''""<Left>
"inoremap ' ''<Left>

" ==============================
" FUNÇÕES PERSONALIZADAS
" ==============================
function! SetPlug() abort
   
    if has('win32') || has('win64')

        let s:vim_plug_path = expand('$USERPROFILE/vimfiles/autoload/plug.vim')
        
        if filereadable(s:vim_plug_path)
        
            let s:plug_dir = expand('$USERPROFILE/vimfiles/plugged')
            let s:plug_exist = v:true
        
        else 
        
            echo "Vim-Plug Windows não encontrado em: " . s:vim_plug_path
        
        endif

    else
        
        let s:config_dir = fnamemodify(resolve( expand($MYVIMRC)), ':h')
        let s:vim_plug_path = s:config_dir.'/autoload/plug.vim' 
        
        if filereadable(s:vim_plug_path)
        
            let s:plug_dir = s:config_dir.'/plugged'
            let s:plug_exist = v:true
        
        else
        
            echo "Vim-Plug Linux não encontrado em : ". s:vim_plug_path
        
        endif
    
    endif
   
endfunction

" Vim-Plug
" ==============================
" CONFIG: Vim-Plug
" ==============================

let s:plug_exist = v:false
let s:plug_dir = ''


call SetPlug()

if s:plug_exist
  
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
else

  echo " Vim-Plug não encontrado"
endif

" ==============================
" TECLAS DE ATALHO
" ==============================
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



























