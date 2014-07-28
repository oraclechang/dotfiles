"####################################################################################################################
" 01. general
"####################################################################################################################
set nocompatible " be iMproved
set nobackup
set nowritebackup
set noswapfile
set tagbsearch    "Tag 를 이진검색
set iminsert=0         " 입력 모드로 들어갈 때 항상 영문으로 시작 
set imsearch=0        " 검색 모드로 들어갈 때 항상 영문으로 시작 
"set autochdir    " 현재 폴더를 열려진 파일로 자동으로 변경. 다른 모듈과 충돌날 수 도 있음
set foldmethod=manual    " 폴딩 
"set paste     " 터미널에서 붙여넣기 시 indent 현상을 방지 할 수 있음. GUI (gvim) 에서는 켜면 안됨. :help paste
set nowrap



"####################################################################################################################
" 02. Events
"####################################################################################################################
au BufEnter /* call LoadCscope()



"####################################################################################################################
" 03. Theme/Color/Font
"####################################################################################################################
"color desert
color jellybeans
"colorscheme solarized and set bg=dark or set bg=light

" 한글 깨짐 해결 
"set fenc=UTF-8 
"set fencs=UTF-8,CP949,EUC-KR 

" font 바꾸었을 때 한글 깨짐 해결 
"set encoding=utf-8 
"set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI 
"set guifontwide=Fixedsys:h11:cDEFAULT 
"lang mes en_US 
"source $VIMRUNTIME/delmenu.vim 
"source $VIMRUNTIME/menu.vim 

"Font 설정 
"set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI 
"set guifont=나눔고딕코딩:h11:cHANGEUL

"창크기 조절 
"au GUIEnter * winsize 150 50

"시작 위치 설정 
"au GUIEnter * winpos -1900 0 

"전체화면으로 시작 
"au GUIEnter  simalt ~x



"####################################################################################################################
" 04. Vim UI
"####################################################################################################################
set nu
set ruler
set showmatch "(=set sm)
set incsearch 
set ic
set hlsearch
"set virtualedit=all 
set smartcase 
"set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P



"####################################################################################################################
" 05. Text Formatting/Layout
"####################################################################################################################
set autoindent
set smartindent
set cindent
"set tabstop=8    "set ts=8            " in vim, help tabstop
set tabstop=4    "set ts=8            " in vim, help tabstop
set shiftwidth=4    " set sw = 4
set softtabstop=4    "set sts=4
"set noexpandtab    " in vim, help noexpandtab
set expandtab    
"set smarttab
syntax on 

autocmd Filetype cpp match Error /\s\+$/    " http://www.guyrutenberg.com/2013/12/07/highlight-whitespace-at-end-of-line-in-vim/
autocmd Filetype python match Error /\s\+$/



"####################################################################################################################
" 06. Bundle
"####################################################################################################################

" Setting up Vundle - the vim plugin bundler
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off " required!

"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'


"------------------------------------------------------------------------------------- 
" My Bundles here:   
" http://lowid.tistory.com/?page=5 
"

"Bundle 'https://github.com/Lokaltog/vim-powerline.git' 
" For powerline
"language en_US.UTF-8
let g:Powerline_symbols = 'fancy'
set laststatus=2


Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
"https://github.com/bling/vim-airline

"Bundle 'c.vim' 
" c의 skel을 미리 작성해 줍니다. snipMate랑 같이쓰세요... 간단한건 아래의 박스... 더 많은 단축키는 여기를 참조하세요 
" http://lug.fh-swf.de/vim/vim-c/csupport.html

Bundle 'DoxygenToolkit.vim' 

"Bundle 'EasyMotion' 
" 단어(word)간 이동을 쉽게 합니다, \\w를 눌러보세요 

"Bundle 'ctags.vim'     
"http://sosal.tistory.com/11

"Bundle 'cscope.vim' 
"https://github.com/vim-scripts/cscope.vim

"Bundle 'snipMate' 
" 명령어 자동완성 기능입니다. 

"Bundle 'ShowMarks' 
" 왼쪽에 마크를 표시해 줍니다.

Bundle 'Align' 
" 원하는데로 정렬을 지정할 수 있습니다  http://www.drchip.org/astronaut/vim/align.html#Examples

Bundle 'Tagbar' 
" taglist와 비슷한 확장기능인데... 그것보다 좀 더 좋아 보이네요.

Bundle 'The-NERD-tree' 
" 이번에도 디렉토리 이동을 쉽게 할 수 있는 확장기능 입니다.  

"Bundle 'AutoComplPop' 
"단어 자동완성

Bundle 'a.vim' 
"소스의 헤더 전환

"Bundle 'minibufexpl.vim' 
" 버퍼를 보기쉽게 만들어 줍니다

"Bundle 'https://github.com/fholgado/minibufexpl.vim'

Bundle 'fholgado/minibufexpl.vim'    
"minibufexpl.vim 의 업데이트 버전

"Bundle 'matchparenpp' 
" 괄호 (),[],{}에 커서를 갖다대면, 상대 괄호를 깜박여 줍니다.

"Bundle 'Solarized'

Bundle 'Source-Explorer-srcexpl.vim' 
"http://neodelicious.tistory.com/242

Bundle 'airblade/vim-gitgutter'
"https://github.com/airblade/vim-gitgutter 
"let g:gitgutter_enabled = 0 
let g:gitgutter_realtime = 0 
let g:gitgutter_eager = 0

Bundle 'Syntastic' 
"uber awesome syntax and errors highlighter

"Bundle 'altercation/vim-colors-solarized' 

"Bundle 'christoomey/vim-tmux-navigator'

Bundle 'ctrlp.vim'

Bundle 'ack.vim'

Bundle 'rking/ag.vim'
" https://github.com/rking/ag.vim

"Bundle 'UltiSnips'

"Bundle 'SirVer/ultisnips'
"https://github.com/sirver/ultisnips

" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'
"https://github.com/honza/vim-snippets

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Bundle 'jellybeans.vim'
highlight WarningMsg ctermfg=15 ctermbg=12 guifg=White guibg=Red gui=NONE

"------------------------------------------------------------------------------------- 

" original repos on github
Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...


filetype plugin indent on " required!
"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end



"####################################################################################################################
" 07. Plugin
"####################################################################################################################
" For ctags and taglist   
"let Tlist_Exit_OnlyWindow = 1     " close Tlist window


"tags 
"set tags=$OWN/sys/src/tags 
set tags=./tags,tags;$HOME  "http://stackoverflow.com/questions/11975316/vim-ctags-tag-not-found

"cscope    // http://vimdoc.sourceforge.net/htmldoc/if_cscop.html#cscope-options 
set csprg=/usr/bin/cscope 
set csto=0    " *cscopetagorder* *csto* . 0 이면 cscope 먼저 사용. 1이면 tag 먼저 사용.  
set cst    " *cscopetag* *cst* . tag 대신 cstag 를 사용. http://vimdoc.sourceforge.net/htmldoc/if_cscop.html . 반대는 set nocst 
set nocsverb

"if filereadable("./cscope.out") 
"   cs add cscope.out 
"else 
   "cs add /usr/src/linux/cscope.out 
"   cs add $OWN/sys/src/cscope.out 
"endif 
"set csverb 


"for Autoloading Cscope Database  http://vim.wikia.com/wiki/Autoloading_Cscope_Database   
function! LoadCscope() 
  let db = findfile("cscope.out", ".;") 
  if (!empty(db)) 
    let path = strpart(db, 0, match(db, "/cscope.out$")) 
    set nocscopeverbose " suppress 'duplicate connection' error 
    exe "cs add " . db . " " . path 
    set cscopeverbose 
  endif 
endfunction


" http://vim.wikia.com/wiki/Cscope 
if has('cscope') 
  set cscopetag 
  "set cscopeverbose 
  if has('quickfix') 
    set cscopequickfix=s-,c-,d-,i-,t-,e- 
  endif 
  cnoreabbrev csa cs add 
  cnoreabbrev csf cs find 
  cnoreabbrev csk cs kill 
  cnoreabbrev csr cs reset 
  cnoreabbrev css cs show 
  cnoreabbrev csh cs help 
  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src 

  " Using 'CTRL-spacebar' then a search type makes the vim window 
  " split horizontally, with search result displayed in 
  " the new window.
  nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
  nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
  nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

  " Hitting CTRL-space *twice* before the search type does a vertical 
  " split instead of a horizontal one
  nmap <C-Space><C-Space>s
  \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>g
  \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>c
  \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>t
  \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>e
  \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>i
  \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-Space><C-Space>d 
  \:vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif


" For silver searcher and ag.vim

let g:agprg="/usr/local/bin/ag --column"


"####################################################################################################################
" 08. Mapping
"####################################################################################################################
nnoremap <F8> :SrcExplToggle<CR>
nnoremap <F9> :NERDTreeToggle<CR> 
nnoremap <F10> :TagbarToggle<CR>

:nn <A-a> <C-a>





"####################################################################################################################
" 09. functions
"####################################################################################################################
function RefineOptStep()
    ":%s/TABLE used.*//
    :%s/(selibm.\{-})//
    :%s/address.*$//
endfunction
