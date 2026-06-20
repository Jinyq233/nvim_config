-- plugins/lsp.lua  语言服务器协议 (LSP) 配置
-- 作用：Mason 管理 LSP 安装，vim.lsp.config 配置各语言 server

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "pyright",
  },
  handlers = {
    function() end, -- 禁用默认 lspconfig handler，改用 vim.lsp.config
  },
})

local telescope = require("telescope.builtin")
local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {
      buffer = bufnr,
      desc = desc,
    })
  end

  -- Telescope LSP
  map("n", "gd", telescope.lsp_definitions, "跳转到定义")
  map("n", "gr", telescope.lsp_references, "查看引用")
  map("n", "gi", telescope.lsp_implementations, "查看实现")
  map("n", "gt", telescope.lsp_type_definitions, "类型定义")

  -- 原生 LSP
  map("n", "K", vim.lsp.buf.hover, "悬浮文档")
  map("n", "<C-k>", vim.lsp.buf.signature_help, "参数提示")
  map("n", "<leader>rn", vim.lsp.buf.rename, "重命名")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "代码操作")

  -- 诊断
  map("n", "[d", vim.diagnostic.goto_prev, "上一个诊断")
  map("n", "]d", vim.diagnostic.goto_next, "下一个诊断")
  map("n", "<leader>d", vim.diagnostic.open_float, "查看诊断")
end


--------------------------------------------------
-- Lua
--------------------------------------------------
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- 启用已配置的 LSP server
vim.lsp.enable("lua_ls")


vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.enable("pyright")


vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = on_attach,

  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
})

vim.lsp.enable("clangd")