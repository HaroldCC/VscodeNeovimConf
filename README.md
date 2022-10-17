# VsCodeVim 配置分享

## 现存痛点
    1.VscodeVim插件输入卡顿
    2.VscodeNeoVim Visual默认选中非Vscode选中，需要使用Ctrl+Shift+p 进行切换 

## NeoVim介绍
    NeoVim：LunarVim AstroVim  -- which key 方便记忆快捷键
    缺点：
        live_grep 不好使
        懒得折腾工作区配置
        lua_language_server 占内存

## Vscode vim 方案

* VscodeNeoVim 插件

    优点：默认编辑比VscodeVim插件流畅，可以使用lua配置，可以添加插件（我并未添加成功过）

    缺点：Visual选择问题；没有easymotion插件，surrounded插件；最重要 ——> 滚屏
* VscodeVim 插件

    优点：自带easymotion，surrounded等插件，滚屏

    缺点：输入偶尔出现卡顿情况（现已解决）

## 我的配置介绍

* 插件

    multi-command           by ryuta46

    Vim                     by vscodevim

    Which Key               by VSpaceCode

    Keyboard QuickFix       by Pascal Senn

* 窗口

    1.左右上下窗口焦点切换、缩放

    2.当前窗口最大化

    3.当前组内窗口快速选择

    4.文件浏览器打开关闭，新建文件夹或文件

    5.代码大纲视图打开关闭

    6.代码快速浏览

    7.前进和后退

    8.查看引用和调用层级

## 配置使用方案
* 复制settings.json内容到您的用户settings.json文件中
* 复制keybindings.json内容到您的用户keybindings.json文件中
* 设置中添加VscodeVim.vim 路径
