set relativenumber
syntax on
colorscheme slate
highlight Normal ctermbg=none
highlight NonText ctermbg=none
set autoindent
set tabstop=4
"set shiftwidth=4
"set expandtab
set laststatus=2
set mouse=a
set clipboard=unnamed

" Don't use the arrow keys, scrublord
nnoremap <Left> :echo "Chom."<CR>
vnoremap <Left> :<C-u>echo "Chom."<CR>
inoremap <Left> <C-o>:echo "Chom."<CR>

nnoremap <Right> :echo "Chom."<CR>
vnoremap <Right> :<C-u>echo "Chom."<CR>
inoremap <Right> <C-o>:echo "Chom."<CR>

nnoremap <Up> :echo "Chom."<CR>
vnoremap <Up> :<C-u>echo "Chom."<CR>
inoremap <Up> <C-o>:echo "Chom."<CR>

nnoremap <Down> :echo "Chom."<CR>
vnoremap <Down> :<C-u>echo "Chom."<CR>
inoremap <Down> <C-o>:echo "Chom."<CR>

hi MatchParen cterm=none ctermbg=green ctermfg=blue
