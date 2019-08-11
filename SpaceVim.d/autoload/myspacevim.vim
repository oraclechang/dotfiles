function! myspacevim#before() abort
    "let g:neomake_enabled_c_makers = ['clang']
    "nnoremap jk <Esc>
    "nnoremap <F3> :set nonu<CR>:set relativenumber!<CR>
    "nnoremap <F4> :ClangFormat<CR>
	"nnoremap <silent> <F5> :ClangFormat<CR>:w<CR>:call SpaceVim#plugins#runner#open('ninja')<CR>
	nnoremap <silent> <F5> :ClangFormat<CR> :w<CR> :call SpaceVim#plugins#runner#open('ninja -C ./build/')<CR>
	"nnoremap <silent> <F5> :call SpaceVim#plugins#runner#open('ninja')<CR>
	"nnoremap <silent> <F5> :call SpaceVim#plugins#runner#open('ninja -C ./build/')<CR>

    if executable('rg')
        set grepprg=rg\ --vimgrep\ --color=never
        let g:FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
    endif

    nnoremap <silent> K :grep! "\b\s?<C-R><C-W>\b"<CR>:cw<CR>
    "nnoremap <silent> K :call SpaceVim#plugins#runner#open('rg --vimgrep --color=never "\b\s?<C-R><C-W>\b"')<CR>

    set ic
    set mouse=r

    let g:spacevim_enable_vimfiler_welcome = 0
endfunction

function! myspacevim#after() abort
endfunction

