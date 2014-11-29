" Platform
function! MySys()
 if has("win32")
 return "windows"
 else
 return "linux"
 endif
 endfunction
 function! SwitchToBuf(filename)
 "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
 " find in current tab
 let bufwinnr = bufwinnr(a:filename)
 if bufwinnr != -1
 exec bufwinnr . "wincmd w"
 return
 else
 " find in each tab
 tabfirst
 let tab = 1
 while tab <= tabpagenr("$")
 let bufwinnr = bufwinnr(a:filename)
 if bufwinnr != -1
 exec "normal " . tab . "gt"
 exec bufwinnr . "wincmd w"
 return
 endif
 tabnext
 let tab = tab + 1
 endwhile
" not exist, new tab
 exec "tabnew " . a:filename
 endif
 endfunction
 "Fast edit vimrc
 if MySys() == 'linux'
 "Fast reloading of the .vimrc
 map <silent> <leader>ss :source ~/.vimrc<cr>
 "Fast editing of .vimrc
 map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
 "When .vimrc is edited, reload it
 autocmd! bufwritepost .vimrc source ~/.vimrc
 elseif MySys() == 'windows'
 " Set helplang
 set helplang=cn
 "Fast reloading of the _vimrc
 map <silent> <leader>ss :source ~/_vimrc<cr>
 "Fast editing of _vimrc
 map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<cr>
 "When _vimrc is edited, reload it
 autocmd! bufwritepost _vimrc source ~/_vimrc
 endif
" For windows version
 if MySys() == 'windows'
 source $VIMRUNTIME/mswin.vim
 behave mswin
 endif

 "禁用VI兼容模式 

 set nocompatible     

 "Vim 的内部编码

 set encoding=utf-8         

 "Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)

 set termencoding=utf-8          

 "Vim 当前编辑的文件在存储时的编码

 set fileencoding=utf-8     

 "Vim 打开文件时的尝试使用的编码

 set fileencodings=ucs-bom,utf-8,gbk,default,latin1 

 "设置中文帮助

 set helplang=cn

"设置字体

if has("gui_running")
set guifont=Consolas:h9
endif
" 格式化高亮
syntax on
" 显示行号
set nu
" 括号匹配
set showmatch
"自动检测文件类型
filetype plugin indent on 
"在缩进和遇到 Tab 键时使用空格替代
set expandtab
"根据文件类型设置缩进格式
au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4
" 启动vim时不要自动折叠代码
set foldlevel=100  
"自动对齐       
set ai   
"依据上面的对起格式
set si  
set smarttab
set wrap
set lbr
set tw=0
set foldmethod=syntax
colorscheme molokai
if has("gui_running")
   set guifont=Consolas:h9
" set color schema
endif
" Sets how many lines of history VIM har to remember
set history=400
" Set to auto read when a file is changed from the outside
set autoread
" Have the mouse enabled all the time:
set mouse=a
" Do not redraw, when running macros.. lazyredraw
set lz
" set 7 lines to the curors - when moving vertical..
set so=7
" The commandbar is 2 high
set cmdheight=2
" Change buffer - without saving
set hid
" Ignore case when searching
" set ignorecase
set incsearch
" Set magic on
set magic
" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=
" How many tenths of a second to blink
set mat=4
" Highlight search things
set hlsearch
" Turn backup off
set nobackup
set nowb
set noswapfile
" smart backspace
set backspace=start,indent,eol
" switch buffers with Tab
map <C-Tab> :bn<CR>
map <S-Tab> :bp<CR>
if MySys() == "windows"   "设定windows系统中ctags程序的位置
        let Tlist_Ctags_Cmd = 'ctags'
elseif MySys() == "linux"  "设定linux系统中ctags程序的位置
        let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
endif
"只显示当前文件的
let Tlist_Show_One_File = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示taglist窗口配置好以后
let Tlist_Use_Right_Window = 1   
map <silent> <F9> :TlistToggle<cr> 
let g:winManagerWindowLayout='TagList,BufExplorer|FileExplorer'
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <F8> :WMToggle<cr>
set completeopt=longest,menu 
let g:neocomplcache_enable_at_startup = 1
"界面设置
set cmdheight=1 "命令行（在状态行下）的高度，默认为1，这里是2
set t_Co=256 "让终端支持256色，否则很多配色不会正常显示，molokai就是其中之一
set background=dark
colorscheme molokai
set helplang=cn "设置中文帮助
set autochdir "自动切换文件目录
set fileformat=unix "设置文件格式
set tabstop=4 "设置tab字符
set shiftwidth=4 "设置shift宽度
set sts=4
set nobackup "不生成备份文件
set noswapfile "不要生成swap文件，当buffer被丢弃的时候隐藏它
set nu "设置行号
set showmatch "高亮显示匹配的括号
set iskeyword+=_,$,@,%,#,- "带有如下符号的单词不要被换行分割
set wildignore=*.o,*.obj,*.bak,*.exe "Tab补全时忽略这些忽略这些
set showtabline=1 "设置标签页 0永远不显示 1 两个以上显示 2 永远显示
set foldenable "用空格键来开关折叠
set foldmethod=manual
set clipboard+=unnamed "共享外部剪贴板 in windows
set magic "正则 Set magic on
set noerrorbells "取消滴滴声 :) No sound on errors.
set novisualbell
set whichwrap=b,s,<,>,[,] "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
"set et "编辑时将所有tab替换为空格
set ambiwidth=double "防止特殊符号无法正常显示，如五角星等
set laststatus=2
set autoread "当文件内容被其他编辑器改变时自动加载
set novisualbell "不要闪烁
set modifiable "允许修改缓冲区内容
set fillchars=vert:\ ,stl:\ ,stlnc:\ "在被分割的窗口间显示空白，便于阅读
set hidden
set modifiable
set write
set wildmenu "候选词出现在界面上
"set listchars=tab:▸\ ,eol:¬
set keywordprg=help
"set paste "终端code格式
set display=lastline
set wrap
set tags=./tags,./TAGS,tags,TAGS,./../tags,./../../tags,./../../../tags
"set gcr=a:block-blinkon1000
"set guioptions-=m "隐藏菜单栏
"set guioptions-=T "隐藏工具栏
"set guioptions-=L "隐藏左侧滚动条
"set guioptions-=r "隐藏右侧滚动条
"set guioptions-=b "隐藏底部滚动条
"set showtabline=0 "隐藏Tab栏
":tabnew "新建标签页
":tabs "显示已打开标签页的列表
":tabc "关闭当前标签页
":tabn "移动到下一个标签页
":tabp "移动到上一个标签页
":tabfirst "移动到第一个标签页
":tablast "移动到最后一个标签页
" search setting {{{
set incsearch "从键入时就开始匹配
set hlsearch "高亮搜索结果
set ignorecase smartcase "搜索时不区分大小写，如果键入了大写字母则区分大小写
" }}}
""高亮字符，让其不受100列限制
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
"match OverLength '\%100v.*'
"set colorcolumn=120
"set list
"set listchars=tab:--,trail:-
"hi SpecialKey ctermfg=77 guifg=#696969
""可以在buffer的任何区域使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
""自动载入
"au BufWinLeave * silent mkview
"au BufWinEnter * silent loadview
"" => Files and backups
"---------------Files and backups{{{
" 把html文件当作xml文件来编辑，因为html按=号格式化有问题，而xml没问题
"au FileType smarty,html set ft=xml
au FileType smarty,html set syntax=html " 语法高亮还是用html自身的高亮
" JavaScript 语法高亮
"au FileType html,htm,smarty,javascript let g:javascript_enable_domhtmlcss = 1
" 给 Javascript 文件添加 Dict
"au FileType html,htm,smarty,javascript setlocal dict+=~/.vim/dict/javascript.dict
" 给 CSS 文件添加 Dict
"au FileType html,htm,smarty,css setlocal dict+=~/.vim/dict/css.dict
" vim不会像认php、java等一样认得json，所以需要加这句，遇到.json后缀的，告诉一下vim这个是json
au BufRead,BufNewFile *.json set filetype=json
"au FileType php,python,c,java,javascript,html,htm,smarty,json call SetOption()
" Objective-C
autocmd! BufNewFile,BufRead *.m set filetype=objc
" ActionScript
autocmd! BufNewFile,BufRead *.as set filetype=actionscript
autocmd! BufNewFile,BufRead *.mxml set filetype=mxml
" SCSS
autocmd! BufNewFile,BufRead *.scss set filetype=scss.css
" eRuby
autocmd! BufNewFile,BufRead *.erb set filetype=eruby.html
" JSON
"autocmd! BufNewFile,BufRead *.json set filetype=javascript
" GitIgnore
autocmd! BufNewFile,BufRead *.gitignore set filetype=gitignore
" ZSH
autocmd! BufNewFile,BufRead *.zsh-theme set filetype=zsh
" Nginx Config
autocmd! BufNewFile,BufRead nginx.conf set filetype=nginx
" CocoaPods
autocmd! BufNewFile,BufRead Podfile,*.podspec set filetype=ruby
" Txt
autocmd BufNewFile,Bufread *.txt set syntax=help
autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"
"}}}
"Using vim as calculator
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
" Python
if executable("python")
autocmd BufRead,BufNewFile *.py map <F5> :% w !python<CR>
else
autocmd BufRead,BufNewFile *.py map <F5> :echo "you need to install Python first!"<CR>
endif
" Php
if executable("php")
autocmd BufRead,BufNewFile *.php map <F5> :% w !php<CR>
else
autocmd BufRead,BufNewFile *.php map <F5> :echo "you need to install php first!"<CR>
endif
" VimScript
autocmd BufRead,BufNewFile *.vim map <F5> :source %<CR>:echon "script reloaded!"<CR>

