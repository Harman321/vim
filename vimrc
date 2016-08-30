"==================================
"    Vim基本配置
"===================================


"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"指定配色方案为256色
set t_Co=256


" go config
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

autocmd FileType go autocmd BufWritePre <buffer> Fmt

"开启语法高亮功能
syntax enable
syntax on

colorscheme molokai
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0

"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
"配置backspace键工作方式
set backspace=indent,eol,start

"显示行号
set number

" 设置粘贴
set pastetoggle=<F11>

"为方便复制，用<F2>开启/关闭行号显示
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nmap <F3> :Tagbar<CR>
"设置按F4就更新tags的方法
nmap <F4> :call Do_CsTag()<CR>
nmap <F5> :NERDTreeToggle<CR>

"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=10000

"设置取消备份 禁止临时文件生成
set nobackup
"set noswapfile

"突出现实当前行列
"set cursorline
"set cursorcolumn

"高亮search命中的文本
set hlsearch
"随着键入即时搜索
set incsearch
"搜索时忽略大小写
"set ignorecase

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
"set showmatch

"设置C/C++方式自动对齐
set autoindent
set cindent

" Display extra whitespace
set list listchars=tab:»·,trail:·

"设置搜索时忽略大小写
set ignorecase

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a
"set mouse=v

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab


"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"使用Vundle来管理Vundle
"Bundle 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'


Plugin 'majutsushi/tagbar'
map <silent>tl :TagbarToggle<CR>        "快捷键设置
let g:tagbar_ctags_bin='ctags'            "ctags程序的路径
let g:tagbar_width=30                    "窗口宽度的设置
let g:tagbar_autofocus=1
let g:tagbar_sort = 0
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"如果是c语言的程序的话，tagbar自动开启


Plugin 'scrooloose/nerdtree'
"let NERDTreeWinPos='right'
let NERDTreeWinPos="left"
let NERDChristmasTree=0
let NERDTreeWinSize=20
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"let NERDTreeShowBookmarks=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Automatically open a NERDTree if no files where specified
"autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open a NERDTree



Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0

map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>

Plugin 'Lokaltog/vim-powerline'
set laststatus=1
let g:Powerline_symbols='unicode'




Plugin 'fatih/vim-go'


"Plugin 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on



if has("cscope")
    set csprg=cscope
    set nocsverb
    set cst
    if filereadable(".cscope.out")
        cs add .cscope.out
    elseif filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif


nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


nnoremap <C-J> <C-W><C-J> "Ctrl-j to move down a split  
nnoremap <C-K> <C-W><C-K> "Ctrl-k to move up a split  
nnoremap <C-L> <C-W><C-L> "Ctrl-l to move    right a split  
nnoremap <C-H> <C-W><C-H> "Ctrl-h to move left a split

inoremap <C-F>             <C-X><C-F>
inoremap <C-D>             <C-X><C-D>
inoremap <C-L>             <C-X><C-L>

function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif

    if has("cscope")
        silent! execute "cs kill -1"
    endif

    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif

    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif

    if(executable('ctags'))
        "silent!
        "execute
        ""!ctags
        -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif

    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"

        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction
