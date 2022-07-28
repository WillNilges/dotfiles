set number
syntax on
"set listchars="    ":\|\ 
set list
colorscheme industry
highlight Normal ctermbg=none
highlight NonText ctermbg=none
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set mouse=a
set clipboard=unnamed
"set clipboard=unnamedplus
"Plug 'bfredl/nvim-miniyank'
"map p <Plug>(miniyank-autoput)
"map P <Plug>(miniyank-autoPut)

noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

