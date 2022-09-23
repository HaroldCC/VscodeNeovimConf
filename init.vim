" 始终都会加载的配置项
let mapleader = "\<space>"
" 使用系统剪切板
set clipboard+=unnamedplus
set ignorecase
set smartcase

" 支持鼠标
set mouse=a
" 设置tab缩进数量
set tabstop=4
" 设置>>与<<的缩进数量
set shiftwidth=4
" 将缩进转换为空格
set expandtab
" 自动高亮匹配符号
set showmatch

" 自动切换输入法
autocmd InsertLeave * :silent :!im-select 1033
autocmd InsertEnter * :silent :!im-select 2052

nnoremap vv <C-v>

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

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none

vnoremap . :normal! .<CR>
inoremap jk <ESC>
nnoremap <leader>s :%s/\<<C-R><C-W>\>//g<left><left>
vnoremap <leader>s :%s/\<<C-R><C-W>\>//g<left><left>
" 左右比例控制
nnoremap <leader>h <C-w><
nnoremap <leader>k <C-w>>
nnoremap s, :vertical resize -20<CR>
nnoremap s. :vertical resize +20<CR>
" 上下比例
nnoremap sj :resize +10<CR>
nnoremap sk :resize -10<CR>

" 等比例
nnoremap s= <C-w>=

vnoremap > >gv
vnoremap < <gv
"在visual 模式里粘贴不要复制
vnoremap p "_dP

nnoremap "" mQlbi"<ESC>ea"<ESC>`Ql

" 复制后高亮
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

" ----- settings ----
if exists('g:vscode')

    function! s:vscodeCommentary(...) abort
        if !a:0
            let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
            return 'g@'
        elseif a:0 > 1
            let [line1, line2] = [a:1, a:2]
        else
            let [line1, line2] = [line("'["), line("']")]
        endif
    
        call VSCodeCallRange('editor.action.commentLine', line1, line2, 0)
    endfunction
    
    " Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
    xnoremap <expr> gc <SID>vscodeCommentary()
    nnoremap <expr> gc <SID>vscodeCommentary()
    nnoremap <expr> gC <SID>vscodeCommentary() . '_'
    
    " ----- Plug -----
    "  call plug#begin('~/.config/nvim/autoload/')
    "      " 快速跳转
    "      Plug 'asvetliakov/vim-easymotion'
    "      " 包裹修改
    "      Plug 'tpope/vim-surround'
    "  call plug#end()
    " 切换行注释    
    "nnoremap gc <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>
    " 切换块注释
    "nnoremap gC <Cmd>call VSCodeNotify('editor.action.blockComment')<CR>
    " 展开所有折叠
    nnoremap zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
    " 关闭所有折叠
    nnoremap zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
    " 展开当下折叠
    nnoremap zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
    " 关闭当下折叠
    nnoremap zc <Cmd>call VSCodeNotify('editor.fold')<CR>
    " 切换当下折叠
    "nnoremap zz <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
    " 转到文件中上一个问题
    nnoremap gp <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
    " 转到文件中下一个问题
    nnoremap gn <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
    " 用H替换掉^
    "noremap H ^
    " 用L替换掉$
    "noremap L $
    " 使用vscode的undo替换nvim的undo
    nnoremap u <Cmd>call VSCodeNotify('undo')<CR>
    " easymotion相关配置
    let g:EasyMotion_smartcase = 0
    " easymotion前缀 leader leader
    map <Leader> <Plug>(easymotion-prefix)
    " 其他键位绑定
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)
    
    nnoremap ; <Cmd>call VSCodeNotify('whichkey.show')<cr>
    nnoremap <leader><tab> <Cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>
    nnoremap <leader><leader><tab> <Cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>

    nnoremap <leader>n <Cmd>call VSCodeNotify('workbench.action.navigateForward')<cr>
    nnoremap <leader>p <Cmd>call VSCodeNotify('workbench.action.navigateBack')<cr>

    nnoremap <leader>f <Cmd>call VSCodeNotify('editor.action.formatDocument')<cr>

    nnoremap <leader>u <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<cr>
    nnoremap <leader>U <Cmd>call VSCodeNotify('references-view.findReferences')<cr>
    nnoremap <leader>ch <Cmd>call VSCodeNotify('references-view.showCallHierarchy')<cr>

    nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
    nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<cr>
    nnoremap <Alt><Enter> <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<Cr>

    nnoremap <expr> <Leader>p VSCodeNotify('workbench.action.navigateBack')
    nnoremap <expr> <Leader>n VSCodeNotify('workbench.action.navigateForward')

    nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

    " windows 
    nnoremap <Leader>q :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
    nnoremap <Leader>w :call VSCodeNotify('workbench.action.files.save')<CR>
    nnoremap <expr> <Leader>sl <SID>split('l', '__vscode_new__')
    nnoremap <expr> <Leader>sh <SID>split('h', '__vscode_new__')
    nnoremap <expr> <Leader>sj <SID>split('j', '__vscode_new__')
    nnoremap <expr> <Leader>sk <SID>split('k', '__vscode_new__')
    nnoremap <Leader><Leader>o :Only!<CR>

    " format
    nnoremap <Leader>f :call VSCodeNotify('editor.action.format')<CR>
    xnoremap <expr> <Leader>f <SID>rangeExitSelection("editor.action.formatSelection")()

    " comment
    xnoremap <expr> <Leader>cc       <SID>rangeExitSelection('editor.action.addCommentLine')()
    nnoremap <expr> <Leader>cc       <SID>rangeExitSelection('editor.action.addCommentLine')() . '_'
    xnoremap <expr> <Leader>cu       <SID>rangeExitSelection('editor.action.removeCommentLine')()
    nnoremap <expr> <Leader>cu       <SID>rangeExitSelection('editor.action.removeCommentLine')() . '_'
    xnoremap <expr> <Leader>c<Space> <SID>rangeExitSelection('editor.action.commentLine')()
    nnoremap <expr> <Leader>c<Space> <SID>rangeExitSelection('editor.action.commentLine')() . '_'

    function! s:range(cmd, ...) abort
        let selection = get(a:, 1, 0)
        normal! gv
        let visualmode = visualmode()
        if visualmode == "V"
            echom 'capitcal V'
            let startLine = line("v")
            let endLine = line(".")
            call VSCodeNotifyRange(a:cmd, startLine, endLine, selection)
        else
            echom 'small V'
            let startPos = getpos("v")
            let endPos = getpos(".")
            call VSCodeNotifyRangePos(a:cmd, startPos[1], endPos[1], startPos[2], endPos[2], selection)
        endif
    endfunction

    function s:rangeExitSelection(cmd)
        function! s:vscodeRange(...) abort closure
          if !a:0
                let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
                return 'g@'
            elseif a:0 > 1
                let [line1, line2] = [a:1, a:2]
            else
                let [line1, line2] = [line("'["), line("']")]
            endif

            call VSCodeCallRange(a:cmd, line1, line2, 0)
        endfunction

        return function('s:vscodeRange')
    endfunction

    function! s:split(...) abort
        let direction = 'workbench.action.splitEditorRight'
        let file = a:2

        if a:1 ==? 'h'
            let direction = 'workbench.action.splitEditorLeft'
        elseif a:1 ==? 'l'
            let direction = 'workbench.action.splitEditorRight'
        elseif a:1 ==? 'j'
            let direction = 'workbench.action.splitEditorDown'
        elseif a:1 ==? 'k'
            let direction = 'workbench.action.splitEditorUp'
        endif

        call VSCodeCall(direction)
        if file != ''
            call VSCodeExtensionNotify('open-file', expand(file), 'all')
        endif
    endfunction
endif