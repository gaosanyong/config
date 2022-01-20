
"Don't put any lines in your vimrc that you don't understand
"https://dougblack.io/words/a-good-vimrc.html

"Colors
colorscheme desert "awesome colorscheme
syntax enable      "enable syntax highlighting

"Toggle background transparency
let t:is_transparent = 0                                                                        
function! Toggle_transparent_background()                                                       
    if t:is_transparent == 0                                                                      
        hi Normal guibg=#111111 ctermbg=black                                                       
        let t:is_transparent = 1                                                                    
    else                                                                                          
        hi Normal guibg=NONE ctermbg=NONE                                                           
        let t:is_transparent = 0                                                                    
    endif                                                                                         
endfunction                                                                                     
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>

set expandtab      "tabs are spaces
set shiftwidth=4   "number of spaces per indent
set smarttab       "use shiftwidth, tabstop softtabstop smartly
set softtabstop=4  "number of spaces in tab when editing
set tabstop=4      "number of visual space per TAB
set laststatus=2   "current file name
set statusline+=%F "full path to file

"UI Config
filetype indent on "load filetype-specific indent file
set cursorline     "lighlight cursor line
set lazyredraw     "redraw only when we need to 
set nowrap         "turn off line wrap
set number         "turn on line number
set relativenumber "turn on relative number
set showcmd        "show command in bottom bar
set wildmenu       "visual autocomplete for command menu
set showmatch      "highlight matching [{()}]

"Searching
set incsearch      "search as characters are entered
set ignorecase     "search case insensitive
set hlsearch       "highlight matches

"Folding
set foldenable        "enable folding
set foldlevelstart=10 "open most folds by default
set foldnestmax=10    "10 nested fold max
set foldmethod=indent "fold based on indent level

"Run Commands
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe') "copy yanked content to clipboard

"Closing brace/bracket/parenthesis
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Plug-in Manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'honza/vim-snippets'      "snipMate & UltiSnip snippets
Plug 'itchyny/lightline.vim'   "light & configurable statusline/tabline
Plug 'SirVer/ultisnips'        "ultimate solution for snippets
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>" " list all snippets for current filetype
