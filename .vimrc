let mapleader = "\<space>"
set clipboard =unnamed "默认的剪切寄存器" set ignorecase "忽略大小写"

set is
set ignorecase
set backspace=indent,eol,start
set clipboard=unnamed
set number

nnoremap vv <c-v>
inoremap jk <ESC>

"选中代码缩进
vnoremap > >gv
vnoremap < <gv

"删除设置
nnoremap dd    "_dd
nnoremap daw   "_daw
nnoremap dw    "_dw
nnoremap D     "_D
nnoremap di"   "_di"
nnoremap di(   "_di(
nnoremap di{   "_di{

nnoremap <leader>dd    "+dd
nnoremap <leader>daw   "+daw
nnoremap <leader>dw    "+dw
nnoremap <leader>D     "+D
nnoremap <leader>di"   "+di"
nnoremap <leader>di(   "+di(
nnoremap <leader>di{   "+di{

vnoremap dd    "_dd
vnoremap daw   "_daw
vnoremap dw    "_dw
vnoremap D     "_D
vnoremap di"   "_di"
vnoremap di(   "_di(
vnoremap di{   "_di{

vnoremap <leader>dd    "+dd
vnoremap <leader>daw   "+daw
vnoremap <leader>dw    "+dw
vnoremap <leader>D     "+D
vnoremap <leader>di"   "+di"
vnoremap <leader>di(   "+di(
vnoremap <leader>di{   "+di{

vnoremap . :normal! .<CR>
nnoremap <leader>s :%s/\<<C-R><C-W>\>//g<left><left>
vnoremap <leader>s :%s/\<<C-R><C-W>\>//g<left><left>
"在visual 模式里粘贴不要复制
vnoremap p "_dP

" 自动切换输入法
autocmd InsertLeave * :silent :!im-select 1033
autocmd InsertEnter * :silent :!im-select 2052

"翻屏
nnoremap s <nop>
nnoremap su <C-u>
nnoremap sd <C-d>
nnoremap sf <C-f>
nnoremap sb <C-b>

nnoremap <leader>m :vsc Edit.NextMethod<CR> " 下一个NextMethod
nnoremap <leader>M :vsc Edit.PreviousMethod<CR> " 上一个NextMethod

nnoremap <F2> :vsc Refactor.Rename<cr>

vnoremap <leader>cs :vsc Edit.ConvertTabsToSpaces<CR>
":nnoremap zm :vsc VAssistX.ListMethodsInCurrentFile<cr> "函数列表"
":nnoremap cj :vsc VAssistX.FindReferencesinFile<CR> "当前文件中的引用"
":nnoremap gr :vsc VAssistX.FindReferences<CR> "查看所有引用"
":nnoremap gR :vsc VAssistX.FindAllReferences<CR> "查看所有引用"
:nnoremap <leader>fo :vsc File.OpenContainingFolder<CR> "打开所在文件夹"
":nnoremap zp :vsc VAssistX.RefactorImplementInterface<CR> "实现接口"

nnoremap J :vsc Window.NextDocumentWindowNav<CR>

":nnoremap <leader>vo :vsc VAssistX.FindSymbolDialog<CR>
":nnoremap <leader>vf :vsc VAssistX.OpenFileInSolutionDialog<CR>

:nnoremap <leader>l <C-w>l
:nnoremap <leader>k <C-w>k
:nnoremap <leader>h <C-w>h
:nnoremap <leader>j <C-w>j

:nnoremap < :vertical resize+5<CR>
:nnoremap > :vertical resize-5<CR>

:nnoremap <leader><tab> :vsc Window.NextTab<CR>
:nnoremap <leader><leader><tab> :vsc Window.PreviousTab<CR>

:nnoremap ,n :vsc Window.NextDocumentWindow<CR>
:nnoremap ,p :vsc Window.PreviousDocumentWindow<CR>

"显示错误列表的快捷键
":nnoremap el :vsc View.ErrorList<CR>
:nnoremap <leader>e :vsc View.NextError<CR>
:nnoremap <leader>E :vsc View.PreviousError<CR>

"居中显示查找结果
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz

"快速查看方法的所有定义,鼠标在方法parameter上的时候显示的东西
:nnoremap K :vsc Edit.ParameterInfo<CR>

"nnoremap <C-o> :vsc VAssistX.ListMethosInCurrentFile<CR>

nnoremap <leader>p :vsc View.NavigateBackward<CR>
nnoremap <leader>n :vsc View.NavigateForward<CR>
nnoremap ;e :vsc View.SolutionExplorer<CR>


inoremap <C-h> <ESC>I
inoremap jk <ESC>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>

" 格式化
nnoremap <leader>f :vsc Edit.FormaDocument<CR>
vnoremap <leader>f :vsc Edit.FormatSelection<CR>
