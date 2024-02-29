return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
            },
        })

        -- Format manually
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

        -- Format before save
        vim.keymap.set("n", "<leader>w", function()
            vim.lsp.buf.format()
            vim.cmd(":w")
        end)

        -- Define a function to format the buffer and save the file
    end,
}
