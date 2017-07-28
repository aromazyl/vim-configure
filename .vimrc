set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" ==============================================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" ==============================================================================
" 安装的所有插件
call vundle#begin()

" 必须安装，let Vundle manage Vundle, required
Plugin 'neovimhaskell/haskell-vim'
Plugin 'VundleVim/Vundle.vim'
" Bundle 'dgryski/vim-godef'
" Plugin 'tikhomirov/vim-glsl'
" Bundle 'beyondmarc/glsl.vim'
Bundle 'sheerun/vim-polyglot'
Plugin 'edkolev/promptline.vim'
Bundle 'dgryski/vim-godef'
Bundle 'vim-scripts/pathogen.vim'
Bundle 'Blackrush/vim-gocode'
Bundle 'majutsushi/tagbar'
Plugin 'vim-scripts/opencl.vim'
Plugin 'google/vim-maktaba'
Plugin 'bazelbuild/vim-bazel'
Plugin 'fatih/vim-go'
"Plugin 'davidzchen/vim-bazel'
Plugin 'vim-scripts/scons.vim'
Plugin 'wesleyche/SrcExpl'
Plugin 'wlangstroth/vim-racket'
Plugin 'derekwyatt/vim-scala'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-scripts/matlab.vim'
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
Plugin 'ctrlpvim/ctrlp.vim'

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

" // The switch of the Source Explorer 
nmap <F8> :SrcExplToggle<CR> 
" // The tagbar helper
nmap <F9> :TagbarToggle<CR>

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what
" plugins
" // except itself are using buffers. And you need add their buffer names
" into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
      \ "__Tag_List__", 
      \ "_NERD_tree_" 
      \ ] 

" // Enable/Disable the local definition searching, and
" note that this is not 
" // guaranteed to work, the Source Explorer doesn't
" check the syntax for now. 
" // It only searches for a match with the keyword
" according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file
" when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .'
" or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>"

" // Set "<F3>" key for displaying the previous
" definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F4>" key for displaying the next definition
" in the jump list 
let g:SrcExpl_nextDefKey = "<F4>" 

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

:nnoremap <c-]> g<c-]>
:vnoremap <c-]> g<c-]>
set background=dark
set t_Co=256
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" 使用希腊字母输入
" set digraph
set guifont=Source\ Code\ Pro\ for\ Powerline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:promptline_theme = 'luna'

" air-line

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
set fenc=
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
