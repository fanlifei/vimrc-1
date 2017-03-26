" ----- Basic Settings ----- {{{
  set nocompatible
  let mapleader = " "

  " help language
  set helplang=cn

  " auto read when files changed
  set autoread

  " disuse swapfiles
  set noswapfile

  " backspace
  set backspace=eol,start,indent

  " indent
  set autoindent
  set smartindent
  set shiftwidth=2
  set expandtab
  set tabstop=2

  " line number
  set number
  set relativenumber

  " search
  set ignorecase
  set smartcase
  set hlsearch
  set incsearch

  " status line
  set laststatus=2

  " cursor
  set ruler
  set cursorline

  " scroll off, always 10 row after cursor
  set scrolloff=10

  " filetype plugins
  filetype plugin on
  filetype indent on
" }}}

" ----- GUI Settings ----- {{{
  if has("gui_running")
    " set gui font & size
    set guifont=Sauce_Code_Powerline:h12

    " display gui scrollbar
    et guioptions-=r
    set guioptions-=l
    set guioptions-=L
  endif
" }}}

" ----- Syntax Settings ----- {{{
  if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
  endif
" }}}

" ----- Mappings Settings ----- {{{
  " esc to normal mode
  inoremap jk <ESC>

  " fast save
  nnoremap <Leader>w :w<CR>

  " treat long lines as break lines
  nnoremap k gk
  nnoremap gk k
  nnoremap j gj
  nnoremap gj j

  " banned direction key
  inoremap <LEFT> <NOP>
  inoremap <RIGHT> <NOP>
  inoremap <UP> <NOP>
  inoremap <DOWN> <NOP>

  noremap H ^
  noremap L $

  " open term on neovim
  if has('nvim')
    noremap <leader>sh :bo sp term://zsh\|resize 10<CR>i
    tnoremap jk <C-\><C-n>
  endif

  " fast configure .vimrc
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>sv :source $MYVIMRC<cr>

  " fast switch buffer
  nnoremap <leader>n :bp<cr>
  nnoremap <leader>m :bn<cr>

  " smart way to move between windows
  nnoremap <Leader>j <C-W>j
  nnoremap <Leader>k <C-W>k
  nnoremap <Leader>h <C-W>h
  nnoremap <Leader>l <C-W>l
" }}}

" ----- Plugin Settings ----- {{{
  call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug'

    " language
    Plug 'JSON.vim'
    Plug 'cespare/vim-toml'
    Plug 'tpope/vim-markdown'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    " interface
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " helper
    Plug 'taglist.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Raimondi/delimitMate'
    " Plug 'easymotion/vim-easymotion'
    Plug 'ShowTrailingWhitespace'
    Plug 'wakatime/vim-wakatime'

    " syntax lint
    " Plug 'scrooloose/syntastic'
    Plug 'w0rp/ale'

    " snippets
    Plug 'Emmet.vim'
    Plug 'Valloric/YouCompleteMe'
    Plug 'marijnh/tern_for_vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'justinj/vim-react-snippets'

    " color scheme
    Plug 'flazz/vim-colorschemes'
    Plug 'tomasr/molokai'
    Plug 'joshdick/onedark.vim'
    Plug 'chriskempson/tomorrow-theme'
  call plug#end()
" }}}

" ----- Color Scheme Settings ----- {{{
  syntax enable
  set background=dark
  colorscheme Tomorrow-Night-Eighties
" }}}

" ----- Plugin Configure Settings ----- {{{
  " ctrlp
  let g:ctrlp_cmd = 'CtrlPMRU'
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|node_modules)$',
    \ 'file': '\v\.(exe|so|dll)$',
  \ }

  " Emmet.vim
  let g:user_emmet_expandabbr_key = '<C-e>'

  " NERDTree
  let NERDTreeShowHidden=1
  noremap <c-b> :NERDTreeToggle<cr>
  "  autocmd vimenter * NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

  " YouCompleteMe
  let g:ycm_auto_trigger = 1
  let g:ycm_min_num_of_chars_for_completion = 3
  let g:ycm_autoclose_preview_window_after_completion=1
  let g:ycm_complete_in_comments = 1
  let g:ycm_key_list_select_completion = ['<C-n>']
  let g:ycm_key_list_previous_completion = ['<C-m>']
  let g:ycm_semantic_triggers = {
      \   'css': [ 're!^\s{2}', 're!:\s+'],
      \   'html': [ '</' ],
      \ }

  " nerdcommenter
  let g:NERDSpaceDelims=1

  " vim-javascript
  let javascript_enable_domhtmlcss = 1

  " taglist.vim
  noremap <silent> <leader>tl :TlistToggle<cr>
  let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'
  let g:Tlist_Exit_OnlyWindow=1
  let g:Tlist_Use_Right_Window=1

  " airline
  let g:airline_theme="tomorrow"
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1

  " vim-jsx
  let g:jsx_ext_required = 0
" }}}
