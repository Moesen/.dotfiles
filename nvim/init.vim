lua require('plugins')
lua require('keymap')
lua require('vimtex')
lua require('colors')
lua require('basic')

" CONDA SETUP
if has('nvim') && !empty($CONDA_PREFIX)
	let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
endif

" Auto completion for coc using tab instead
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Improving the experience
" Use <Tab> and <S-Tab> to navigate the completion list:

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"