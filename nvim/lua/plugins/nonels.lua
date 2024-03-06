return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
      },
    })

    -- Format manually
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

    -- Save all files
    vim.keymap.set("n", "<leader>w", function()
      vim.cmd(":wa")
    end)

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    -- Define a function to format the buffer and save the file
  end,
}
