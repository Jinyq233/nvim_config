require("nvim-treesitter.config").setup({
    ensure_installed = {
        "vim",
        "vimdoc",
        "bash",
        "c",
        "cpp",
        "cuda",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
        "tsx",
        "css",
        "rust",
        "markdown",
        "markdown_inline",
    },

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
})