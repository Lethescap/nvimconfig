require "nvchad.options"

-- add yours here!

local opt = vim.opt


-- Use PowerShell as default Shell on Windows
if vim.fn.has "win32" == 1 then
  opt.shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"
  opt.shellcmdflag =
    "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
  opt.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
  opt.shellpipe = '2>&1 | %{ "$_" } | tee %s; exit $LastExitCode'
  opt.shellquote = ""
  opt.shellxquote = ""
end


--- Common
-- NvChad 默认只设置高亮当前行的行号，这里把整行也高亮了
opt.cursorlineopt = "both"

-- 开启相对行号
opt.relativenumber = true

-- 显示特殊字符，比如尾随空格和 Tab
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- 启用 break indent，这个选项的意思是当一行过长触发自动换行时，会给换行前面添加一点缩进，跟容易识别
-- 说实话我个人不喜欢这个选项，所以这边默认注释掉了，你可以取消注释试试看喜不喜欢
-- opt.breakindent = true

-- 替换文本时展示一个单独的预览窗口，显示替换了哪几行
-- 这选项默认是 "nosplit"，也就是不展示这个预览窗口
-- 我个人不太需要这个选项，所以默认注释掉了，你可以取消注释试试看看喜不喜欢
-- opt.inccommand = "split"

-- 用来控制你滚动时上下至少要在视图里保留多少行
-- 默认这项是不配置的，所以你的光标可以滚动到当前视图的最后一行
-- 我不太习惯配置这个选项，所以默认注释掉了，你可以取消注释试试看看喜不喜欢
opt.scrolloff = 2




