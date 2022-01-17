" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"

call plug#begin('~/.vim/plugged')

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Linting
Plug 'w0rp/ale'
Plug 'nathunsmitty/nvim-ale-diagnostic'

" Formatting
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }
Plug 'sdiehl/vim-ormolu'

" Fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Utils
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'jlanzarotta/bufexplorer'
Plug 'rking/ag.vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kburdett/vim-nuuid'
" Plug 'SirVer/ultisnips'

" Colors
Plug 'jim-at-jibba/ariake-vim-colors'
Plug 'sainnhe/sonokai'
Plug 'glepnir/zephyr-nvim'
Plug 'bluz71/vim-nightfly-guicolors'

" Extra syntax highlighting
Plug 'rescript-lang/vim-rescript'

call plug#end()

" show line numbers
set number
set rnu

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :wa<cr>

" Recursively check up the folder structure for tag files
set tags=tags;/

" highlights the 100th column for a visual guide to good length
" set cc=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" window split defaults
set splitbelow
set splitright

set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (has("termguicolors"))
 set termguicolors
endif

" Enable syntax highlighting
syntax enable

" extra colour options
let base16colorspace=256
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" colour scheme
colorscheme sonokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search)
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Open bufExplore in a split
map <leader>be :BufExplorer<cr>
map <leader>bv :BufExplorerVerticalSplit<cr>
map <leader>bh :BufExplorerHorizontalSplit<cr>

" Open list of all files modified in git
map <leader>bg :FzfGFiles?<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Set the tab line status back to default (I think it is change by a plugin)
" showtabline=1 only shows the tab bar when there are two or more tabs 
set showtabline=1

" Neovim terminal mode remappings
if has('nvim')
  :tnoremap <Esc> <C-\><C-n>
endif

" Easymotion
map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-s2)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make 0 go to the first text on the line, not the far left. More useful
map 0 ^

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.jsx :call DeleteTrailingWS()
autocmd BufWrite *.json :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cope display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ultisnips setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" let g:UltiSnipsExpandTrigger="<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribbling
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" FZF support
map <F2> :FZF<cr>
let g:fzf_command_prefix = 'Fzf'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mark's mis-spellings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:iabbrev consoel console
:iabbrev conseol console
:iabbrev funciton function
:iabbrev retrun return
:iabbrev flase false

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Linting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Find references
map <leader>r :lua vim.lsp.buf.references()<cr>

" Go to definition
map <leader>d :lua vim.lsp.buf.definition()<cr>

" Fixit
map <leader>f :lua vim.lsp.buf.code_action()<cr>

" Describe types
map <leader>t :lua vim.lsp.buf.hover()<cr>

" Rename
map <leader>rn :lua vim.lsp.buf.rename()<cr>

map <leader>fm :lua vim.lsp.buf.formatting_sync(nil, 1000)<cr>


" Auto-complete?
" let g:ale_completion_enabled = 1

" Error settings
let g:ale_set_loclist = 1

" Disable ales lsp
let g:ale_disable_lsp = 1

" Show errors on hover
" let g:ale_virtualtext_cursor = 1

" Display Errors list
map <leader>e :lop<cr>

" Close Errors list
map <leader>lc :lclose<cr>

" prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html Prettier


" set up haskell
lua require'lspconfig'.hls.setup{}

" attach completion to buffers
autocmd BufEnter * lua require'completion'.on_attach()

" get completion in omnifunc popups
autocmd BufEnter * set omnifunc=v:lua.vim.lsp.omnifunc

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_signature = 1
let g:completion_enable_auto_paren = 0
set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" trigger autocomplete in insert mode
inoremap <c-space> <c-x><c-o>

" Fold stuff
set nofoldenable
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
