return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "cssls",
          "lua_ls",
          "ts_ls",
          "svelte",
          "rust_analyzer",
          "eslint",
          "jsonls",
          "vuels",
          "bashls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "<leader>,", vim.diagnostic.open_float)
      vim.keymap.set("n", "<C-w>", function()
        vim.diagnostic.goto_prev()
        vim.cmd("norm! zz")
      end)
      vim.keymap.set("n", "<C-e>", function()
        vim.diagnostic.goto_next()
        vim.cmd("norm! zz")
      end)
      -- vim.keymap.set("n", "<leader>z", vim.diagnostic.setloclist)

      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("svelte", {
        on_attach = function(client)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end,
          })
        end,
      })

      -- lspconfig.svelte.setup({ capabilities = capabilities })
      -- To notify the svelte lsp when ts/js files change
      -- lspconfig.svelte.setup({
      --   on_attach = function(client)
      --     vim.api.nvim_create_autocmd("BufWritePost", {
      --       pattern = { "*.js", "*.ts" },
      --       callback = function(ctx)
      --         client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
      --       end,
      --     })
      --   end,
      -- })
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })
      vim.lsp.config("eslint", {
        capabilities = capabilities,
      })
      vim.lsp.config("jsonls", { capabilities = capabilities })
      vim.lsp.config("vuels", { capabilities = capabilities })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set({ "n", "s" }, "<leader>.", vim.lsp.buf.code_action, opts)

          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      })
    end,
  },
}
