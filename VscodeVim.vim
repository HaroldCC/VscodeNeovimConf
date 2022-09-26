" 始终都会加载的配置项
let mapleader = "\<space>"

nnoremap vv <C-v>
inoremap jk <ESC>

"nnoremap ;n :noh<CR>

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

vnoremap d     "_d
vnoremap dd    "_dd
vnoremap daw   "_daw
vnoremap dw    "_dw
vnoremap D     "_D
vnoremap di"   "_di"
vnoremap di(   "_di(
vnoremap di{   "_di{

vnoremap <leader>d     "+d
vnoremap <leader>dd    "+dd
vnoremap <leader>daw   "+daw
vnoremap <leader>dw    "+dw
vnoremap <leader>D     "+D
vnoremap <leader>di"   "+di"
vnoremap <leader>di(   "+di(
vnoremap <leader>di{   "+di{

vnoremap . :normal! .<CR>
inoremap jk <ESC>
nnoremap <leader>s :%s/\<<C-R><C-W>\>//g<left><left>
vnoremap <leader>s :%s/\<<C-R><C-W>\>//g<left><left>

" 窗口比例控制
nnoremap < <C-w><
nnoremap > <C-w>>
nnoremap s, <C-w>+
nnoremap s. <C-w>-
nnoremap s= <C-w>=

"翻屏
nnoremap su <C-u>
nnoremap sd <C-d>
nnoremap sf <C-f>
nnoremap sb <C-b>

"选中代码缩进
vnoremap > >gv
vnoremap < <gv

"在visual 模式里粘贴不要复制
vnoremap p "_dP

nnoremap "" mQlbi"<ESC>ea"<ESC>`Ql
