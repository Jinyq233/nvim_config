-- core/keymaps.lua  快捷键映射
-- 作用：定义全局快捷键（leader、窗口、buffer、插件等）

vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 视觉模式 ----------
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ----------
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

-- ---------- 插件 ----------
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>")

-- 浮窗
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")

-- 函数跳转
local builtin = require("telescope.builtin")

vim.keymap.set("n", "gr", builtin.lsp_references)
vim.keymap.set("n", "gd", builtin.lsp_definitions)
vim.keymap.set("n", "gi", builtin.lsp_implementations)
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols)