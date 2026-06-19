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
    -- "clangd",
    -- "pyright",
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

--------------------------------------------------
-- Lua
--------------------------------------------------
vim.lsp.config("lua_ls", {
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

--------------------------------------------------
-- C / C++ / CUDA
--------------------------------------------------
-- vim.lsp.config("clangd", {
--   capabilities = capabilities,

--   cmd = {
--     "clangd",
--     "--background-index",
--     -- "--clang-tidy",
--     "--completion-style=detailed",
--   },

--   filetypes = {
--     "c",
--     "cpp",
--     "cuda",
--   },
-- })

--------------------------------------------------
-- Python
--------------------------------------------------
-- vim.lsp.config("pyright", {
--   capabilities = capabilities,

--   settings = {
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--         diagnosticMode = "workspace",
--       },
--     },
--   },
-- })

--------------------------------------------------
-- 启动 LSP
--------------------------------------------------
vim.lsp.enable("lua_ls")
-- vim.lsp.enable("clangd")
-- vim.lsp.enable("pyright")
