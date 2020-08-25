
"Don't put any lines in your vimrc that you don't understand
"https://dougblack.io/words/a-good-vimrc.html

"Colors
colorscheme desert "awesome colorscheme
syntax enable      "enable syntax highlighting

"Spaces & Tabs
set tabstop=4      "number of visual space per TAB
set softtabstop=4  "number of spaces in tab when editing
set expandtab      "tabs are spaces
set shiftwidth=4   "number of spaces per indent
set smarttab       "use shiftwidth, tabstop softtabstop smartly

"UI Config
set number         "show line numbers
set showcmd        "show command in bottom bar
set cursorline     "lighlight cursor line
filetype indent on "load filetype-specific indent file
set wildmenu       "visual autocomplete for command menu
set lazyredraw     "redraw only when we need to 
set showmatch      "highlight matching [{()}]

"Searching
set incsearch      "search as characters are entered
set hlsearch       "highlight matches
"nnoremap <leader><space> :nohlsearch<CR> "turn off search highlight

"Folding
set foldenable        "enable folding
set foldlevelstart=10 "open most folds by default
set foldnestmax=10    "10 nested fold max
"nnoremap <space> za "space open/close folds
set foldmethod=indent "fold based on indent level

"Movement
"nnoremap j gj "move vertically by visual line
"nnoremap k gk
"nnoremap B ^ "move to beginning/end of line
"nnoremap E $
"nnoremap $ <nop> "$/^ doesn't do anything
"nnoremap ^ <nop>
"nnoremap gV `[v`] "highlight last inserted text 

"Leader Shortcuts
"let mapleader="," "leader is comma
"inoremap jk <esc> "jk is escape
"nnoremap <leader>u :GundoToggle<CR> "toggle gundo

"Closing brace/bracket/parenthesis
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
