-- init.lua  入口文件，Neovim 启动时自动加载
-- 作用：引导插件管理器，加载核心配置和各插件配置

require("plugins.plugins-setup")      -- 1. 引导 lazy.nvim 插件管理器 + 声明所有插件

require("core.options")               -- 2. 全局选项（缩进、行号、搜索、主题等）
require("core.keymaps")               -- 3. 快捷键映射

require("plugins.lualine")            -- 状态栏
require("plugins/nvim-tree")          -- 文件树
require("plugins/treesitter")         -- 语法高亮
require("plugins/lsp")                -- Mason + LSP 配置
require("plugins/cmp")                -- 自动补全
require("plugins/comment")            -- 注释 gcc/gc
require("plugins/autopairs")          -- 括号自动配对
require("plugins/bufferline")         -- Buffer 标签栏
require("plugins/telescope")          -- 模糊搜索
require("plugins/gitsigns")           -- Git 标记
require("plugins/which-key")          -- 快捷键提示
require("plugins/colorscheme")        -- Tokyo Night 主题