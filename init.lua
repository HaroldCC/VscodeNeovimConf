vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- 配置剪切板
vim.opt.clipboard = "unnamed,unnamedplus"

local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

-- " 自动切换输入法
vim.cmd [[autocmd InsertLeave * :silent :!im-select 1033]]
vim.cmd [[autocmd InsertEnter * :silent :!im-select 2052]]

-- 上下移动选中---
vim.cmd [[
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
]]

map("n", "vv", "<C-v>", opt)

-- 删除设置
vim.cmd([[nnoremap dd    "_dd]])
vim.cmd([[nnoremap daw   "_daw]])
vim.cmd([[nnoremap dw    "_dw]])
vim.cmd([[nnoremap D     "_D]])
vim.cmd([[nnoremap di"   "_di"]])
vim.cmd([[nnoremap di(   "_di(]])
vim.cmd([[nnoremap di{   "_di{]])

vim.cmd([[nnoremap <leader>dd    "+dd]])
vim.cmd([[nnoremap <leader>daw   "+daw]])
vim.cmd([[nnoremap <leader>dw    "+dw]])
vim.cmd([[nnoremap <leader>D     "+D]])
vim.cmd([[nnoremap <leader>di"   "+di"]])
vim.cmd([[nnoremap <leader>di(   "+di(]])
vim.cmd([[nnoremap <leader>di{   "+di{]])

vim.cmd([[vnoremap d     "_d]])
vim.cmd([[vnoremap dd    "_dd]])
vim.cmd([[vnoremap daw   "_daw]])
vim.cmd([[vnoremap dw    "_dw]])
vim.cmd([[vnoremap D     "_D]])
vim.cmd([[vnoremap di"   "_di"]])
vim.cmd([[vnoremap di(   "_di(]])
vim.cmd([[vnoremap di{   "_di{]])

vim.cmd([[vnoremap <leader>d     "+d]])
vim.cmd([[vnoremap <leader>dd    "+dd]])
vim.cmd([[vnoremap <leader>daw   "+daw]])
vim.cmd([[vnoremap <leader>dw    "+dw]])
vim.cmd([[vnoremap <leader>D     "+D]])
vim.cmd([[vnoremap <leader>di"   "+di"]])
vim.cmd([[vnoremap <leader>di(   "+di(]])
vim.cmd([[vnoremap <leader>di{   "+di{]])

vim.cmd([[highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]])
vim.cmd([[highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]])
vim.cmd([[highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline]])
vim.cmd([[highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline]])
vim.cmd([[highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none]])
vim.cmd([[highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none]])

map("v", ".", ":normal! .<CR>", opt)
map("i", "jk", "<ESC>", opt)
-- 快速翻页
-- map("n", "<leader>s", ":%s/\<<C-R><C-W>\>//g<left><left>", opt)
-- 左右比例控制
-- map("n", "<leader>h", "<C-w><", opt)
-- map("n", "<leader>k", "<C-w>>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

map("v", "L", "$", opt)
map("v", "H", "^", opt)

if vim.g.vscode then

    local rangeHandler = vim.api.nvim_exec([[
        function! s:vscodeFormat(...) abort
            if !a:0
                let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
                return 'g@'
            elseif a:0 > 1
                let [line1, line2] = [a:1, a:2]
            else
                let [line1, line2] = [line("'["), line("']")]
            endif
        
            call VSCodeCallRange('editor.action.formatSelection', line1, line2, 0)
        endfunction
        
        " Bind format to vscode format selection
        xnoremap <expr> <leader>f <SID>vscodeFormat()
        nnoremap <expr> <leader>f <SID>vscodeFormat()
        nnoremap <expr> == <SID>vscodeFormat() . '_'
        
        ]], true)

    vim.api.nvim_exec([[
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
        ]], true)

    vim.cmd([[
        " 复制后高亮
        augroup highlight_yank
            autocmd!
            au TextYankPost * silent! lua vim.highlight.on_yank()
        augroup END
          ]])

    -- 转到文件中上一个问题
    map("n", "g[", "<Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>", opt)
    -- 转到文件中下一个问题
    map("n", "g]", "<Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>", opt)
    -- 使用vscode的undo替换nvim的undo
    map("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>", opt)
    -- easymotion相关配置
    -- let g:EasyMotion_smartcase = 0
    -- easymotion前缀 leader leader
    -- map <Leader> <Plug>(easymotion-prefix)

    map("n", ";", "<Cmd>call VSCodeNotify('whichkey.show')<cr>", opt)

    map("n", "<leader><tab>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>", opt)
    map("n", "<leader><leader><tab>",
        "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>", opt)

    map("n", "<leader>n", "<Cmd>call VSCodeNotify('workbench.action.navigateForward')<cr>", opt)
    map("n", "<leader>p", "<Cmd>call VSCodeNotify('workbench.action.navigateBack')<cr>", opt)

    map("n", "<leader>f", "<Cmd>call VSCodeNotify('editor.action.formatDocument')<cr>", opt)

    map("n", "<leader>u", "<Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<cr>", opt)
    map("n", "<leader>U", "<Cmd>call VSCodeNotify('references-view.findReferences')<cr>", opt)
    map("n", "<leader>ch", "<Cmd>call VSCodeNotify('references-view.showCallHierarchy')<cr>", opt)

    map("v", ">", ">gv", opt)
    map("v", "<", "<gv", opt)
    -- 在visual 模式里粘贴不要复制
    map("v", "p", '"_dP', opt)

    map("n", "<leader>q", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>", opt)
    map("n", "<leader>w", "<Cmd>call VSCodeNotify('workbench.action.files.save')<cr>", opt)
end
