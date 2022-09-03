
"=========================================================================
" DesCRiption: 适合自己使用的vimrc文件 GUI/Console
" Version: 1.3
"=========================================================================
"set shortmess=atI

"======================================================
" 配置多语言环境
"======================================================
set encoding=utf-8 " UTF-8 编码
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk

syntax enable
"syntax on " 自动语法高亮


" 高亮当前行
set cursorline
set nocursorcolumn
"set cc=80
"set cursorcolumn 

"colorscheme  darkblue    "设定配色方案
colorscheme  desert "设定配色方案
set background=dark

"======================================================
" vimdiff config
"======================================================
if &diff
	colors peaksea
	set t_Co=256
endif


"hi Comment  ctermfg=DarkCyan
"hi NonText  guibg=grey80
"hi Normal   guibg=grey90
"hi Visual               term=bold               cterm=bold            
"hi Visual               ctermfg=Black           ctermbg=Grey  
"hi IncSearch            term=bold				cterm=bold
"hi IncSearch			ctermfg=Black			ctermbg=Grey
hi Search               term=bold				cterm=bold
hi Search				ctermfg=Black			ctermbg=Grey
let c_comment_strings=1   " highlight strings inside C comment

"set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

"set nu " 显示行号
set softtabstop=8 "使得按退格键时可以一次删掉4个空格
set tabstop=8     " 设定 tab 长度为 4
set shiftwidth=8  "表示每一级缩进的长度一般设置成跟 softtabstop 一样 
set noexpandtab   "当设置成 expandtab 时缩进用空格来表示noexpandtab 则是用制表符表示一个缩进
set autoindent    "表示自动缩进
set cindent       "针对C语言自动缩进
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan   " 禁止在搜索到文件两端时重新搜索
set incsearch     " 输入搜索内容时就显示搜索结果
set hlsearch      " 搜索时高亮显示被找到的文本
" set showmatch   " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
set smartindent   " 开启新行时使用智能自动缩进
"set mouse=a       " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）

"======================================================
"普通、可视和选择模式下,打开当前目录
"======================================================
noremap td :tabnew .<cr> 

"======================================================
"显示tab键为▸
"=====================================================
"set list
"set listchars=tab:▼\ ,

"======================================
"将ctrl + s设定为保存文件
"=====================================
nmap <C-S> :w!<CR>i
vmap <C-S> <C-C>:w!<CR>
imap <C-S> <Esc>:w!<CR>i

"======================================
"将ctrl + a设定为保存文件不进插入模式
"=====================================
nmap <C-A> :w!<CR>
vmap <C-A> <C-C>:w!<CR>
imap <C-A> <Esc>:w!<CR>

"====================================================
"add by lilong
"====================================================

"----------------------------------------------------
"vim-translator翻译插件快捷键
"插件源:https://github.com/bujnlc8/vim-translator
"----------------------------------------------------
noremap <leader>t :<C-u>Tc<CR>
vnoremap <leader>t :<C-u>Tv<CR>

"vim 退出快捷键
nmap <C-L> :q!<cr>
nmap <C-K> :qa!<cr>
nmap <C-J> :w!<cr>

if &diff
	"vimdiff模式下差异点浏览快捷键
	nmap z] ]c
	nmap z[ [c
else
	"quickfix window map
	nmap <leader>n :cn<cr>
	nmap <leader>p :cp<cr>
	nmap <leader>w :cw 10<cr>
	nmap <leader>e :cclose<cr>
endif

"config externel grep cmd
set grepprg=grep\ -rn\ --exclude-dir=.svn\ --exclude-dir=.git\ --include=*.c\ --include=*.h\ --include=*.cpp\ --include=*.s\ --include=*.dtsi\ --include=*.dts\ --include=*.c\ --include=*.go\ --include=*.txt\ --include=*.rst\ $*\ /dev/null 

"================================================================
"实现多个vim终端之间的复制,原理非常简单,就是利用一个文件来作中转。
"用zw来copy，在另外的终端上用zr来贴。
"================================================================
nmap zr :r $HOME/.vimxfer<CR>
nmap zw :'a,.w! $HOME/.vimxfer<CR>
vmap zr c<esc>:r $HOME/.vimxfer<CR>
vmap zw :w! $HOME/.vimxfer<CR>

"================================================================
"按 q + m 键后在当前行的上方插入一个空行,
"按 m + q 在当前行下面添加一个空行
"================================================================
noremap mq o<esc>
noremap qm O<esc>

"==========================================
"设定vim-powerline 插件
"=========================================
"
"set laststatus=2
"set t_Co=256
"let g:Powerline_symbols = 'unicode'

"================================================================
" plugin - Ttaglist
"=================================================================
let Tlist_Show_One_File = 1      " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1    " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0   " 在左侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
set tags=tags; 
set autochdir

"================================================================
" plugin - winManager 文件浏览器 窗口管理器插件
" 定义打开关闭winmanager按键为 F8
" 按下ctrl + w + f键进入左上脚第一个窗口
" 按下ctrl + w + b三个键进入左下脚窗口
" 当所有编辑的文件都关闭，只剩下winManger的窗口，则退出VIM
" w + m 启动winManager
"=================================================================
let g:winManagerWindowLayout = "FileExplorer|TagList"  "设置界面分割
let g:winManagerWidth =40                  "设置winmanager的宽度，默认为25
let g:defaultExplorer = 1 
let g:persistentBehaviour = 0
let Tlist_WinHeight = 40
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr> 
nmap <silent> mw :WMToggle<cr>


"================================================================
"explorer.vim 文件管理器
let g:explHideFiles='^\.,\.swp$,\.o$,\.[^CcHhSs]$'
let g:explDetailedHelp=0
"================================================================


""""""""""""""""""""""""""""""
" BufExplorer
" """"""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=1       " Split rigth.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:bufExplorerDisableDefaultKeyMapping=0    " Disable mapping.
let g:bufExplorerFindActive=1

"autocmd BufWinEnter \[Buf\ List\] setl nonumber 
nnoremap <silent> \\ :BufExplorer<CR>
nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

filetype plugin indent on 

"===================================================
"CTRL + P补全
"===================================================
"inoremap <C-]>             <C-X><C-]>
"inoremap <C-F>             <C-X><C-F>
"inoremap <C-D>             <C-X><C-D>
"inoremap <C-L>             <C-X><C-L> 
"let g:SuperTabMappingForward = '<s-j>'
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>" 

"-----------------------------------------------------------------------------
"" lookupfile.vim 插件设置
"  映射LookupFile lk
"  映射LUBufs  ll
"  映射LUWalk  lw
"-----------------------------------------------------------------------------
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"let g:LookupFile_SortMethod = ""                "关闭对搜索结果的字母排序

if filereadable("./filenametags")
	"将相对路径转成绝对路径
	let g:fntagspath = getcwd()."/filenametags"
else
	let g:fntagspath = findfile("filenametags", ".;")
endif
let g:LookupFile_TagExpr = "g:fntagspath"

nmap <silent> <leader>zk :LUTags<cr>
nmap <silent> <leader>zl :LUBufs<cr>
nmap <silent> <leader>zw :LUWalk<cr>
nmap <C-\>q :LUTags<cr>

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
 let _tags = &tags
 try
    let &tags = eval(g:LookupFile_TagExpr)
    let newpattern = '\c' . a:pattern
    let tags = taglist(newpattern)
 catch
    echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
    return ""
 finally
	let &tags = _tags
 endtry

" Show the matches for what is typed so far.
 let files = map(tags, 'v:val["filename"]')
 return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc' 

"================================================================
" cscope的配置，可以在顶层目录或者子目录下加载数据库
"=================================================================
if ! &diff
	if has("cscope")
		 cs kill -1 
		 "set csprg=/home/zhang_jianxin2/bin/cscope
		  "set csto=1
		  set cst
		  set nocsverb
		  "set csverb
		  set cspc=5
		  " add any database in current directory
		  if filereadable("cscope.out")
			cs add cscope.out
			let $m=getcwd()
		  else 
			let cscope_file=findfile("cscope.out", ".;")
			let cscope_pre=matchstr(cscope_file,  ".*/")
			if !empty(cscope_file) && filereadable(cscope_file)
				exe "cs add" cscope_file cscope_pre
			endif
			"根据cscope设置源代码顶层目录环境变量
			"step1:将cscope_file转换成字符串形式，并删除起始的'字符
			"step2:将上一步得到的字符串删除文件名，只留下路径目录
			let csfile=substitute(string(cscope_file), "'", "", "g")
			let $m=substitute(csfile, "/cscope.out", "", "g")
		endif
		let g:cscope_dir=finddir("cscope.out", ".;")
		let $sr='g:cscope_dir'
	endif
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>    


"================================================================
" plugin - a.vim在源文件和头文件中切换插件
" 指定查找路径
"=================================================================
let g:alternateSearchPath ='sfr:../,sfr:../src,sfr:../include,sfr:../inc, sfr:../../include,srf:../driver,sfr:./include'
let g:alternateNoDefaultAlternate=1
"nnoremap <silent><F12> :A<CR>
"noremap  cs :A<CR>
"noremap  va :AV<CR>
"noremap  hv :IHV<CR>
"noremap  hs :IHS<CR>
"noremap  ht :IHT<CR>

"================================================================
" plugin - snipMate 代码补全插件
" 不需要配置
"=================================================================
set tags+=~/.vim/tags/eprom_tags


"===============================================================
"bundle/vundle
"===============================================================
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"let path = '~/.vim/bundle/myplugin'
"call vundle#rc(path) “设置插件存储位置
	Bundle 'gmarik/vundle'
	Bundle 'taglist.vim'
	Bundle 'winManager'
"	Bundle 'BufExplorer.zip'
	Bundle 'supertab.vmb'
	Plugin 'a.vim'
filetype plugin indent on
"
"
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
"   :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " Put your non-Plugin stuff after this line


" 设置配色和CSApprox
" set t_Co=256
" let g:CSApprox_attr_map={'bold':'bold','italic':'','sp':''}
" let g:rehash256 = 1
"

"============================================================================================
"" 以下是强制配置，不得修改，须放在 .vimrc 的最后面
"============================================================================================
"set fencs=utf-8,cp936
"
"" 删除行尾空格
nnoremap <leader>f :%s/\s\+$//<cr>

function! KRIndent()
	let c_space_errors = 0
		set fileformats=unix
		set textwidth=120
		set noexpandtab
		set shiftround
		set cindent
		set formatoptions=tcqlron
		set cinoptions=:0,l1,t0,g0
		syntax keyword cType u8 u16 u32 u64 s8 s16 s32 s64 off64_t
		highlight default link LinuxError ErrorMsg

		syntax match LinuxError / \+\ze\t/     " spaces before tab
		syntax match LinuxError /\s\+$/        " trailing whitespaces
		syntax match LinuxError /\%121v.\+/    " virtual column 121 and more
	endfunction
	if has("autocmd")
		autocmd FileType c,cpp,h,hh call KRIndent()
	endif
