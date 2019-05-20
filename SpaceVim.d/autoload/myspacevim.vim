function! myspacevim#before() abort
    "let g:neomake_enabled_c_makers = ['clang']
    "nnoremap jk <Esc>
    "nnoremap <F3> :set nonu<CR>:set relativenumber!<CR>
    "nnoremap <F4> :ClangFormat<CR>
	"nnoremap <silent> <F5> :ClangFormat<CR>:w<CR>:call SpaceVim#plugins#runner#open('ninja')<CR>
	nnoremap <silent> <F5> :call SpaceVim#plugins#runner#open('ninja')<CR>
    set ic
    set mouse=r
endfunction

function! myspacevim#after() abort
endfunction

