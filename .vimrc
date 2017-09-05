set nocompatible

"Vundle setup
let vinstall=0
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vinstall=1
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Bundles
Bundle 'VundleVim/Vundle.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitmate'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'kien/rainbow_parentheses.vim'

if vinstall == 1
    :BundleInstall
endif

"General/misc settings
set number              " Turn on line numbering
set relativenumber      " Make line numbering relative to the current line
syntax on               " Enable syntax highlighting
set t_Co=256            " Make sure vim is using 256 colors
let mapleader=","       " <leader> key, change to your liking
set hidden              " Background unsaved buffers
set mouse=a             " Turn on mouse support
set showcmd             " Display commands as they are typed
set cmdheight=1         " Force the commandbar height to be 1
set wildchar=<TAB>      " Path/file expansion in colon mode
set backspace=2         " Make backspace act normally

"Tab/space/indentation settings
set expandtab           " Use spaces on tab
set shiftwidth=4        " Number of spaces >> and << will indent
set softtabstop=4       " Number of spaces the expanded tab will take up
set tabstop=8           " Number of columns a real tab will take up
set smarttab            " Backspace/tab will indent to next/previous tabwidth
set wrap                " Wraps text to the next line when it reaches the end of the screen
set autoindent          " Automatically indent where possible

"Searching options
set ignorecase          " Ignore case when searching
set smartcase           " If there are caps, go case-sensitive
set infercase           " Case inferred by default
set hlsearch            " Highlight search things
set incsearch           " Make search act like search in modern browsers

"Plugin Settings and functions
function! NERDTreeToggleOrFocus()
    if expand("%") =~ "NERD_tree"
        :NERDTreeToggle
    else
        call NERDTreeFocus()
    endif
endfunction
"Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '|'
let g:airline_right_sep = '|'
"Ctrlp setting
let g:ctrlp_working_path_mode = 'r'
"Ultisnips commands
let g:UltiSnipsExpandTrigger="<C-g>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<C-a>"

"Swap saving settings
if !isdirectory(expand('$HOME/.vim-bak/swap'))
    silent !mkdir -p ~/.vim-bak/swap
endif
set swapfile
set directory^=$HOME/.vim-bak/swap//

"File backup saving settings
if !isdirectory(expand('$HOME/.vim-bak/backup'))
    silent !mkdir -p ~/.vim-bak/backup
endif
set backup
set writebackup
set backupdir=~/.vim-bak/backup

"Undo history saving settings
if !isdirectory(expand('$HOME/.vim-bak/undo'))
    silent !mkdir -p ~/.vim-bak/undo
endif
set undofile
set undodir^=$HOME/.vim-bak/undo//

"Key Maps
nnoremap <leader>p :set nopaste!<CR>
nnoremap <leader>s :set nospell!<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <leader>. :bnext<CR>
nnoremap <leader>m :bprev<CR>
nnoremap <leader>q :bnext <BAR> bd#<CR>
nnoremap <leader>t :enew<CR>
nnoremap <leader>l :ls<CR>
nmap <leader>n :call NERDTreeToggleOrFocus()<CR>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
cnoremap wq!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! <bar> q
