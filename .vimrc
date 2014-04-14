" If you want to RELOAD your .vimrc file without reopening vim, enter this in command mode :so % (errors are normal)
"
" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:	 Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Last change:	         2012 Jan 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Changing leader key
let mapleader = ","

" Instead of for example :w to save a file you can now do ;w, save the shift
nnoremap ; :

" when you yank etc it goes to the default clipboard
set clipboard=unnamed

" automatically indicate column 81 so you know where to stop your code
" automatically executed when the specified file types are opened
au FileType cpp,java,c,python set colorcolumn=81

" highlight search terms
set hlsearch " use :noh when you want do remove the current highlighting
"This unsets the last search pattern register by hitting return (enter)
nnoremap <CR> :noh<CR><CR>

" Map CTRL W W to ,w
" CTRL W W switches windows
nnoremap <Leader>w <C-w>w

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" show search matches as you type
set incsearch

" Decent word wrapping without auto inserting a new line
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set pastetoggle=<F2> "press F2 before you copy text, then F2 again"
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop

set nobackup
set noswapfile	

set hidden " allows you to open a file without having to undo/save a buffer
set visualbell           " don't beep
set noerrorbells         " don't beep

" whitespace in the end
"highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"autocmd InsertEnter * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"autocmd InsertLeave * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Use color scheme (check ~/.vim/fcs for fun color schemes)
if has("gui_running") " If we start vim from the commandline, use the default scheme
    colorscheme wombat256
    " colorscheme macvim
endif
" colorscheme wombat256
" LuciusBlackLowContrast
" LuciusBlack
" LuciusLight
" LuciusDark

" Plugin mappings
" NERDTree - on
" map <leader>ne :NERDTree<cr> -> would toggle NERDTree when ,ne 
command NT NERDTree
" NERDTreeFind - puts cursor on current file in the tree
command NF NERDTreeFind
" TagList - toggle
command TL TlistToggle

" TagList plugin uses other version of ctags (installed via macports)
let Tlist_Ctags_Cmd='/opt/local/bin/ctags'

" I have disabled Syntastic by default and activate/disable error checking with the following in my .vimrc:
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <F5> :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Automatically update error list of syntastic
let g:syntastic_always_populate_loc_list=1
" Automatically open and close error list
let g:syntastic_auto_loc_list=1
" Only open error list when there is at least one error (no warnings)
let g:syntastic_quiet_warnings=1

" Latex-Box plugin default is xdg-open (linux)
let g:LatexBox_viewer='open'
" Some extra flags for latexmk so that it does background compilation
" let g:LatexBox_latexmk_options = "-pvc -pdfps"
" vim has more filetypes for latex files, e.g. plaintex and tex but latex-box
" is unstable with plaintex type so this line forces all tex to be latex type
let g:tex_flavor='latex'
" this enables ,ll to compile and show the pdf on the current line
        map <silent> <Leader>ll :silent
                \ !/Applications/Skim.app/Contents/SharedSupport/displayline
                \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
                \ "%:p" <CR>

" YankRing shortcut
let g:yankring_replace_n_pkey = "<C-p>"
" schrijf de yankring file niet in ~ maar ergens meer verstopt
let g:yrankring_history_dir = '/Users/jvaelen/.vim/bundle/'

" Pathogen allows one to easily install vim plugins
execute pathogen#infect()
execute pathogen#helptags()

" Change easy motion behavior from <Leader><Leader> to <Leader>
" let g:EasyMotion_leader_key = '<Leader>'

" Get used to hjkl!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" The following maximizes macvim or enlarges total terminal when we start vim
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
endif

" The following resets the original height of total terminal when we quit vim
" from console
function! ResetTitle()
    " disable vim's ability to set the title
    exec "set lines=24"
endfunction

au VimLeave * silent call ResetTitle()
