
set nocompatible

"распознавание типов файлов и типо-специфичные плагины:
filetype off
filetype plugin on
filetype plugin indent on


set colorcolumn=80
" Плагины Vundle

"=====================================================
"" Vundle settings
"=====================================================
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'      " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'           " Project and file navigation
Plugin 'majutsushi/tagbar'             " Class/module browser
Plugin 'scrooloose/nerdcommenter'
"" colorscemes
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
""------------------=== Other ===----------------------
Plugin 'bling/vim-airline'              " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'     " Parentheses, brackets, quotes, XML tags, and more
"" python modeld
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
call vundle#end()
"--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'       " Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
"Plugin 'tomtom/tlib_vim'       " dependencies #2
"Plugin 'honza/vim-snippets'        " snippets repo
"
""---------------=== Languages support ===-------------
" --- Python ---
"  Plugin 'klen/python-mode'            " Python mode (docs, refactor, lints,
"  highlighting, run and ipdb and more)
"  Plugin 'davidhalter/jedi-vim'        " Jedi-vim autocomplete plugin
"  Plugin 'mitsuhiko/vim-jinja'     " Jinja support for vim
"  Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
"
"  call vundle#end()                    " required
" настройки Vim-Airline
 set laststatus=2
" let g:airline_theme='badwolf'
 let g:airline_powerline_fonts = 1
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'

map <F2> :TaskList<CR>  


""Настройки табов для Python, согласно рекоммендациям
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
"Автоотступ
set autoindent
""Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
""Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

"Настройка omnicomletion для Python (а так же для js, html и css)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]





"
""Авто комплит по табу
"function InsertTabWrapper()
"let col = col('.') - 1
"if !col || getline('.')[col - 1] !~ '\k'
"return "\"
"else
"return "\<c-p>"
"endif
"endfunction
"imap <c-r>=InsertTabWrapper()"Показываем все полезные опции автокомплита сразу
"set complete=""
"set complete+=.
"set complete+=k
"set complete+=b
"set complete+=t

"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
""В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

""""Дальше мои личные настройки, 
""""в принципе довольно обычные, может кому надо

"Вызываем SnippletsEmu(см. дальше в топике) по ctrl-j
""вместо tab по умолчанию (на табе автокомплит)
let g:snippetsEmu_key = "<C-j>"

" Копи/паст по Ctrl+C/Ctrl+V
" vmap <C-C> "+yi
" imap <C-V> "+gPi
"
 colorscheme twilight "Цветовая схема
 syntax on "Включить подсветку синтаксиса
 set nu "Включаем нумерацию строк
 set mousehide "Спрятать курсор мыши когда набираем текст
 set mouse=a "Включить поддержку мыши
 set termencoding=utf-8 "Кодировка терминала
 set novisualbell "Не мигать 
 set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
" "Удобное поведение backspace
 set backspace=indent,eol,start whichwrap+=<,>,[,]
 "Вырубаем черточки на табах
 set showtabline=0
" "Колоночка, чтобы показывать плюсики для скрытия блоков кода:
 set foldcolumn=1
 :nnoremap <leader>N :setlocal number!<cr>
"
" "Переносим на другую строчку, разрываем строки
 set wrap
 set linebreak
"
" "Вырубаем .swp и ~ (резервные) файлы
 set nobackup
 set noswapfile
 set encoding=utf-8 " Кодировка файлов по умолчанию
 set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в
" unicode кодировке,
" " то будет использоваться cp1251

set showcmd
"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2
set hlsearch
set nowrapscan
set nobackup
set noswapfile
set fileencodings=utf-8,cp1251,koi8-r,cp866
set nocp
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
highlight Comment ctermfg=darkgreen
set tags+=/usr/share/vim/vim73/commontags
set tags+=/home/vlabel/download/modbus/libmodbus-3.0.1/tags
set completeopt=menu,menuone

map <F6> :Dox<CR>

function InsertTabWrapper()
    let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
	return "\<tab>"
	else
	return "\<c-p>"
	endif
	endfunction
	imap <tab> <c-r>=InsertTabWrapper()<cr>
	set complete=""
	set complete+=.
	set complete+=k
	set complete+=b
	set complete+=t
	set completeopt-=previw
	set completeopt+=longest


