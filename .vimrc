
source $VIMRUNTIME/defaults.vim
"original VIMRC
set number
set tabstop=4
set shiftwidth=4
syntax on
"colorscheme torte 
colorscheme zellner 
set hlsearch                   "подсветка результатов поиска
set ls=2                    "строка состояния с путем к файлу
set mouse=
set belloff=all            "отключение пиликания
set list   "отображение табуляции и переноса строки

"горячие клавиши на русской раскладке
set langmap=ролдуиРОЛД;hjklebHJKL
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
"for correct work on windows
set iskeyword=@,48-57,_,192-255 
language ctype Russian_Russia.1251
highlight lCursor guifg=NONE guibg=Cyan

"yaml settings 
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"
let g:javascript_plugin_jsdoc = 1

let Tlist_Inc_Winwidth=0

set nocompatible "netrw и matchit будут работать только с этими тремя надстройками
filetype plugin on
filetype plugin indent on "Определение типа файла для подсветки
runtime macros/matchit.vim
packadd! matchit

set smarttab
set expandtab
set smartindent
set wrap linebreak nolist
set incsearch
set ruler             "показыват точную позицию курсора
set showcmd           "показывает последнюю набранную команду


set runtimepath^=~/.vim/bundle/node


filetype plugin indent on   "Включает определение типа файла, загрузку соответствующих ему плагинов и файлов отступов
set encoding=utf-8
set nocompatible              "Отключает обратную совместимость с Vi
syntax enable                 "Включает подсветку синтаксиса

"let g:netrw_browse_split = 3
"let g:netrw_banner = 0

let g:gitgutter_enabled = 1 "активация гитгуттера
let g:gitgutter_sign_added = '█|'
let g:gitgutter_sign_modified = '█⫶'
let g:gitgutter_sign_removed = '█▁'
let g:gitgutter_sign_removed_first_line = '█▔'
let g:gitgutter_sign_modified_removed = "█▟"
set updatetime=100    "для гитгуттера - ускоряет отклик


if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/pack/plugins')       "Начать искать плагины в этой директории (для вим8, на версиях ниже, надо подключать через vim-plug, PlugInstall)
"call plug#begin('~/.vim/plugged')       "Начать искать плагины в этой директории
                                        "Место для плагинов

packloadall        "загрузчик плагинов для вим версии выше 8, для версий ниже - использовать vim-plug PlugInstall

Plug 'https://github.com/alok/notational-fzf-vim'                    "Заметки
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }    "зависимости для заметок
Plug 'jiangmiao/auto-pairs'    "добавляет парные скобки и прочее..
Plug 'kien/ctrlp.vim'      "позволяет искать файл по краткому пути
Plug  'moll/vim-node'      "позволяет искать файл по краткому пути
Plug 'mattn/emmet-vim'    "emmet for html
Plug 'pangloss/vim-javascript'
Plug 'jbgutierrez/vim-babel'
Plug 'lsdr/monokai'
Plug 'leafgarland/typescript-vim' 
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-surround'
Plug 'mrk21/yaml-vim'
Plug 'yegappan/taglist'     "\:Tlist откроет все названия функций в левом окне
Plug 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)


call plug#end()                         "Перестать это делать

let g:mapleader=','   "наша лидер кей будет запятая
"colorscheme murphy

"настройки для заметок. папки и файлы
let g:nv_search_paths = ['~/wiki', './notes.md']

map <C-n> : NERDTreeToggle<CR>
map <Leader><Plug>(easymotion-prefix)


"  при переходе за границу в 120 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%120v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END




" настройки Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2

" Работа буфферами
map <C-q> :bd<CR> 	   " CTRL+Q - закрыть текущий буффер


" включить подсветку кода
syntax on
if has("gui_running")
" GUI? устаналиваем тему и размер окна
  set lines=50 columns=125
  colorscheme molokai
" раскомментируйте эти строки, если хотите, чтобы NERDTree/TagBar автоматически отображались при запуске vim
" autocmd vimenter * TagbarToggle
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif

" на маке vim?
if has("mac")
  set guifont=Consolas:h13
  set fuoptions=maxvert,maxhorz
else
" дефолтный GUI
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
endif
else
" терминал?
endif

tab sball
set switchbuf=useopen
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -

"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
"let g:pymode_rope = 0
"let g:pymode_rope_completion = 0
"let g:pymode_rope_complete_on_dot = 0
"отключаем отстутпы в плагине тайпскрипт
let g:typescript_indent_disable = 1

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0
