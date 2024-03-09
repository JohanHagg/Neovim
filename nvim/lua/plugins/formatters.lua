-- This will work will preinstalled formatters.
-- I did not have to install these formatters in my Svelte
-- project to get the formatting to work.
return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      -- Note: Remember to check the status bar for the lsp.
      -- That is the name you have to specify in this list.
      -- for example json -> jsonc
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        jsonc = { { "prettierd", "prettier" } },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    local conform = require("conform")

    -- Format manually
    vim.keymap.set("n", "<leader>gf", conform.format, {})
  end,
}
