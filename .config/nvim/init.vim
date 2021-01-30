"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Description:
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

" Plugins will be downloaded under the specified directory.
call plug#begin()

" Declare the list of plugins.
Plug 'neovim/nvim-lsp' " A collection of configs for the native neovim LSP.
Plug 'tpope/vim-commentary' " A `gc` command to comment/uncomment code.
Plug 'tpope/vim-surround' " A `s` text object for the surroundings char.
Plug 'wellle/targets.vim' " Improve existings and add various text objects.
Plug 'ajh17/VimCompletesMe' " Add `Tab` autocompletion.
Plug 'junegunn/fzf' " A fuzzy finder.
Plug 'junegunn/fzf.vim' " The fzf default config.

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

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

" Enable clangd through the nvim 0.5.0 lsp client and the sautoirs/rosary docker image
lua << EOF
-- Embedded C/C++
local clangd = require('lspconfig').clangd
local cmake = require('lspconfig').cmake
local root_dir = clangd.document_config.default_config.root_dir(vim.api.nvim_buf_get_name(0))
local commands = {}
for command in vim.gsplit(vim.call("globpath", root_dir, "**/compile_commands.json"), "\n", true) do table.insert(commands, command) end
table.sort(commands, function (lhs, rhs) return vim.loop.fs_stat(lhs).mtime.sec > vim.loop.fs_stat(rhs).mtime.sec end)
local build_dir = commands[1]:sub(#root_dir + 2):gsub("/?compile_commands.json$", "")
clangd.setup({
    cmd = {
        "docker", "run", "-i", "--rm", "-v", root_dir .. ":/workdir", "sautoirs/rosary:0.4.0",
        "clangd",
            "--clang-tidy",
            "--path-mappings=" .. root_dir .. "=/workdir",
            "--compile-commands-dir=/workdir/" .. build_dir,
    }
})
-- Rust
local rust_analyzer = require('lspconfig').rust_analyzer
rust_analyzer.setup({})
-- Python
local pyls = require('lspconfig').pyls
pyls.setup({})
EOF

" Enable omnifunc for LSP
autocmd FileType c,cpp,rust,python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable formating on save for LSP
autocmd FileType c,cpp,rust,python autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)

" Add LSP mappings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.document_highlight()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <buffer> gr    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <buffer> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> g&    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Use C++ style comments
autocmd FileType c,cpp setlocal commentstring=//\ %s

