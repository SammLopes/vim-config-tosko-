" Vim-Plug

if has('win32') || has('win64')
	let s:plug_dir = expand('$USERPROFILE/vimfiles/plugged')
else
	let s:plug_dir = expand('~/Documentos/vim-config/plugged')

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


" Encerre a declaração do Vim-Plug
call plug#end()

colorscheme desert





