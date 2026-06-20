

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(function()
            vim.treesitter.start(args.buf)
            vim.bo[args.buf].syntax = "OFF"
        end)
    end,
})