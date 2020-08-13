""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Description:
"     A Neovim .vimrc file
"
" Maintainer:
"     sautoirs <sautoirs@protonmail.com>
"
" Complete_version:
"     This file is part of my personal dotfiles
"     and can be found here:
"     https://github.com/sautoirs/dotfiles
"
" Acknowledgments:
"     The file structure has been gleaned from the Kevin Sztern .vimrc.
"     https://github.com/Chewie/dotfiles
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vanilla for now

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General parameters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable file type detection and use it for the plugins and indentations
filetype plugin indent on

" Reload the file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Disable backups, we have source control for that
set nobackup

" Force UTF-8 encoding
set encoding=UTF-8

" Disable swapfiles too
set noswapfile

" Hide buffers instead of closing them
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make backspace behave as expected
set backspace=eol,indent,start

" Set the minimal amount of lines under and above the cursor
set scrolloff=5

" Show current mode
set showmode

" Show command being executed
set showcmd

" Show relative line number
set number relativenumber
highlight LineNr       ctermfg=DarkGray
highlight CursorLineNr ctermfg=DarkGray

" Always show status line
set laststatus=2

" Enhance command line completion
set wildmenu

" Set completion behavior, see :help wildmode for details
set wildmode=longest:full,list:full

" Disable bell completely
set visualbell
set t_vb=

" Color the column after textwidth, usually the 80th
set colorcolumn=+1
highlight ColorColumn ctermfg=none ctermbg=DarkGray

" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:•,nbsp:¤
set fillchars=vert:│
highlight NonText    ctermfg=DarkGray
highlight Whitespace ctermfg=DarkGray

" Enables syntax highlighting
syntax on

" Allow mouse use in vim
" set mouse=a
set mouse= " Disable the mouse to learn vim the hard way!

" Briefly show matching braces, parens, etc
set showmatch

" Enable line wrapping
set wrap

" Wrap on colum 120
set textwidth=119

" Highlight the current line
" set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case on search
set ignorecase

" Ignore case unless there is an uppercase letter in the pattern
set smartcase

" Move cursor to the matched string
set incsearch

" Don't highlight matched strings
set nohlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The length of a tab
set tabstop=8

" The length of a softtab
set shiftwidth=4
set softtabstop=-1

" Use softtabs instead of tabs when pressing tab
set expandtab
set smarttab

" Enable auto indentation based on previous line and file type
set autoindent

" C language indentation options
set cinoptions=(0,u0,U0,t0,g0,N-s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Todo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Todo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin mappings and options 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Todo

