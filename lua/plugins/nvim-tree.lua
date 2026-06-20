-- plugins/nvim-tree.lua  文件树配置
-- 作用：侧边栏文件浏览器，替代默认 netrw

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
