syntax on
set background=dark
set modeline
"set mouse=a
set title
set ai
set laststatus=2
set tabpagemax=25
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'
let g:Powerline_colorscheme = 'default'
set t_Co=256
set smartindent
set hlsearch

syn match WhiteSpace / / conceal cchar=‧
setl conceallevel=2 concealcursor=nv

noremap <esc><left> :tabprev<enter>
noremap <esc><right> :tabnext<enter>
inoremap <esc><left> <esc>:tabprev<enter>
inoremap <esc><right> <esc>:tabnext<enter>

nnoremap <esc><F1> 1gt
nnoremap <esc><F2> 2gt
nnoremap <esc><F3> 3gt
nnoremap <esc><F4> 4gt
nnoremap <esc><F5> 5gt
nnoremap <esc><F6> 6gt
nnoremap <esc><F7> 7gt
nnoremap <esc><F8> 8gt
nnoremap <esc><F9> 9gt
nnoremap <esc><F0> 10gt

if has("gui_running")
	set guifont=Terminus
	"let g:Powerline_symbols = 'fancy'
endif

call pathogen#infect()

" make powerline show a trailing whitespace marker
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

"colorscheme desert
"colorscheme solarized
colorscheme zenburn

if filereadable("/home/kandre/.vim/muttaliasescomplete.vim")
	autocmd FileType mail set omnifunc=muttaliasescomplete#Complete
	source /home/kandre/.vim/muttaliasescomplete.vim
endif


" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

