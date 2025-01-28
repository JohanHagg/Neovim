return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>p", builtin.find_files, {})
      -- only works if ripgrep is installed
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

      vim.keymap.set("n", "<leader>d", builtin.lsp_definitions, {})
      vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, {})
      vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {})

      -- TODO: Leaving here for if I need to make more complex call
      -- -- Keymap for finding references
      -- vim.keymap.set("n", "<leader>gr", function()
      --   builtin.lsp_references({
      --     show_line = true, -- Show the line number for each result
      --   })
      -- end, { desc = "Find LSP References with Telescope" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
