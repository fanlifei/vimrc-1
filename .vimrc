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

  set encoding=utf8
" ----- GUI Settings ----- {{{
  if has("gui_running")
    " set gui font & size
    set guifont=Sauce_Code_Pro_Nerd_Font_Complete:h12

    " display gui scrollbar
    set guioptions-=r
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

  " treat long lines as break lines
  nnoremap k gk
  nnoremap gk k
  nnoremap j gj
  nnoremap gj j

  " banned direction key
  noremap <LEFT> <NOP>
  noremap <RIGHT> <NOP>
  noremap <UP> <NOP>
  noremap <DOWN> <NOP>

  noremap H ^
  noremap L $

  " open term on neovim
  if has('nvim')
    noremap <leader>sh :bo sp term://zsh\|resize 8<CR>i
    tnoremap jk <C-\><C-n>
  endif

  " fast configure .vimrc
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>sv :source $MYVIMRC<cr>

  nnoremap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>

  " fast switch buffer
  nnoremap - :bp<cr>
  nnoremap = :bn<cr>

  " smart way to move between windows
  nnoremap <C-j> <C-W>j
  nnoremap <C-k> <C-W>k
  nnoremap <C-h> <C-W>h
  nnoremap <C-l> <C-W>l
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
    Plug 'fatih/vim-go'
    Plug 'blockloop/vim-swigjs'
    Plug 'briancollins/vim-jst'

    " interface
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " helper
    Plug 'taglist.vim'
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'ervandew/supertab'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Raimondi/delimitMate'
    Plug 'easymotion/vim-easymotion'
    Plug 'ShowTrailingWhitespace'
    Plug 'sheerun/vim-polyglot'
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
    Plug 'tomasr/molokai'
    Plug 'ajh17/spacegray.vim'
    Plug 'joshdick/onedark.vim'
  call plug#end()
" }}}

" ----- Color Scheme Settings ----- {{{
  syntax enable
  set background=dark
  " colorscheme molokai
  " colorscheme spacegray
  colorscheme onedark
" }}}

" ----- Plugin Configure Settings ----- {{{
  " FZF
  nnoremap <Leader>p :Buffers<CR>
  nnoremap <C-p> :Files<CR>

  " SuperTab
  let g:SuperTabDefaultCompletionType = "<c-n>"

  " ale
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \ }

  " Emmet.vim
  let g:user_emmet_expandabbr_key = '<C-e>'

  " NERDTree
  let NERDTreeShowHidden=1
  noremap <c-b> :NERDTreeToggle<cr>
  "  autocmd vimenter * NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
  " nerdtree syntax highlight
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1
  let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
  let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

  " YouCompleteMe
  let g:ycm_auto_trigger = 1
  let g:ycm_min_num_of_chars_for_completion = 2
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
  let g:airline_theme="jellybeans"
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1

  " vim-jsx
  let g:jsx_ext_required = 0
" }}}
