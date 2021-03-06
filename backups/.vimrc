if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = ","
call plug#begin()
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-plug'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
call plug#end()

nnoremap <C-S-tab> 	:tabprevious<CR>
nnoremap <C-tab> 	:tabnext<CR>
nnoremap <C-t>		:tabnew<CR>
inoremap <C-S-tab>	<Esc>:tabprevious<CR>i
inoremap <C-tab>	<Esc>:tabnext<CR>i
inoremap <C-t>		<Esc>:tabnew<CR>i

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

map <C-o> :NERDTreeToggle<CR>
set number
filetype indent on
set showmatch
set tabstop=4
colorscheme gotham256
" colorscheme badwolf
let g:airline_powerline_fonts = 1
let g:airline_theme='gotham256'
