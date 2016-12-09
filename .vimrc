set nocompatible              " be iMproved, required
filetype off                  " required

" ==============================================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" ==============================================================================
" 安装的所有插件
call vundle#begin()

" 必须安装，let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'derekwyatt/vim-scala'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'
" 来自github

"主题
Plugin 'flazz/vim-colorschemes' 
"Plugin 'vim-colorschemes/colors/codeschool.vim'
"Plugin 'tomasr/molokai'
"let g:molokai_original = 1
"let g:rehash256 = 1
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/google.vim'
Plugin 'vim-scripts/cpp.vim'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/python.vim'
" vim 模版
Plugin 'aperezdc/vim-template'
Plugin 'vim-scripts/nginx.vim'
" vim 语法校验
" Plugin 'scrooloose/syntastic'

"底部状态栏
Plugin 'Lokaltog/vim-powerline'

"文件目录
Plugin 'scrooloose/nerdtree'

"快速查找
Plugin 'kien/ctrlp.vim'

"快速注释
Plugin 'scrooloose/nerdcommenter'

"自动补全
Plugin 'Shougo/neocomplcache.vim'

" 来自vim

" non github repos

call vundle#end()            " required

" ==============================================================================
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ==============================================================================
" vundle命令
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" ==============================================================================
" 组件设置
" flazz/vim-colorschemes,主题设置
colorscheme molokai

"NERDTree 插件配置
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1 "NERDTREE显示隐藏文件 
" ==============================================================================
" vim原生设置
" set rnu "显示相对行号
set nu
syntax on " 打开语法检测

set tabstop=2 "设置tab键长度
set sw=2
set ts=2

set list "设置空格显示为+号
set listchars=trail:+

set foldmethod=syntax "代码折叠
set foldlevelstart=99 "默认不折叠

set cursorline  "设置光标行
set noswapfile "不要生成swap文件
set nobackup
set bufhidden=hide "当buffer被丢弃的时候隐藏它
set guicursor=n-v-c:hor10 "normal下贯标显示为下划线
set expandtab                 "Use space instead of tabs

let mapleader = ","  "设置外部复制粘帖
let g:mapleader = ","
map Y "+y
map P "+p

"noremap ok o<esc> "插入新行

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm.app"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

"neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1 "打开vim时自动打开
let g:neocomplcache_force_overwrite_completefunc = 1
let g:airline_theme='luna' 

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
set hlsearch
set tags=tags;/
set backspace=2
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" 
" let g:syntastic_error_symbol='>>'
" let g:syntastic_warning_symbol='>'
" fun! SetMkfile()
"   let filemk = "Makefile"
"   let pathmk = "./"
"   let depth = 1
"   while depth < 4
"     if filereadable(pathmk . filemk)
"       return pathmk
"     endif
"     let depth += 1
"     let pathmk = "../" . pathmk
"   endwhile
"   return "."
" endf
" 
" command! -nargs=* Make tabnew | let $mkpath = SetMkfile() | make <args> -C $mkpath | cwindow 10
" set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ ..
let g:username = 'zhangyule'
let g:email = 'zyl2336709@gmail.com'
set guifont=Dijkstra\ 12
