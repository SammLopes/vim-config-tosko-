" Vim-Plug
" Configure o diretório de plugins, se desejar
call plug#begin('~/.vim/plugged')

" Adicione plugins aqui

" Plugins
" NERDTree
Plug 'preservim/nerdtree'
Plug 'ObserverOfTime/coloresque.vim'
Plug 'vim-airline/vim-airline'
"Plug 'TaDaa/vimade'
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }


" Encerre a declaração do Vim-Plug
call plug#end()

colorscheme desert





