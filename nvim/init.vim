lua require('plugins')
lua require('basic')
lua require('keymap')
lua require('colors') 
lua require('vimtex')
lua require('formatting/markdown')


" spellchecking


" Something with colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
syntax enable

" CONDA SETUP
if has('nvim') && !empty($CONDA_PREFIX)
	let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
endif

set nowrap

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ CheckBackSpace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" black formating
nmap <leader>bl :Black<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Something with scrolling
set scrolloff=5

" Coc jump to next and previous diagnostic
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Breakpoints for python
" https://codereview.stackexchange.com/questions/217932/python-breakpoints-in-vim-vimscript

" Comments binding
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary
imap <C-_> <Esc><Plug>CommentaryLineA

" Setting tabs to work as normal
nnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" Setting <C-I> to something else
nnoremap <C-p> <C-i>

" Pydocstring
" https://github.com/yaegassy/coc-pydocstring
nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)

" NERDTree keybindis.
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" " Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"     \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

autocmd FileType markdown setlocal spell spelllang=en_us 
autocmd FileType gitcommit setlocal spell spelllang=en_us 

nnoremap <M-z> :ToggleTerminal<Enter>
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" Distraction free writing integration
autocmd! User GoyoEnter Limelight | set wrap
autocmd! User GoyoLeave Limelight! | set nowrap

" Keymaps for opening, and sourcing vimrc
map <leader>vm :vsp $MYVIMRC<CR>
map <leader>sv :source $MYVIMRC<CR>

" Move latex build files to build folder in vimtex
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}

" Spellchecking
" setlocal spell spelllang=en_us

" Copy all matches from register
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
map <leader>cm :let @a=''<cr>:bufdo CopyMatches A<cr>

map <leader>rr :CocCommand rust-analyzer.reload<cr>

map <leader>pr :term python3 % <CR>

" Obsidian
map <leader>ot :ObsidianToday <CR>

" Snippets
map <leader>as :CocCommand snippets.editSnippets <CR>
