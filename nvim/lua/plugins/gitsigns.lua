return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        -- Local helper that I don't know what it's for
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- TODO: Figure out if this is useful
        -- map("n", "<leader>ts", gitsigns.stage_hunk)
        map("n", "<leader>tu", gitsigns.reset_hunk)

        -- TODO: Find better key binding to use Ctrl
        map("n", "<leader>tn", gitsigns.next_hunk)

        -- Preview hunk as popout modal
        map("n", "<leader>tp", gitsigns.preview_hunk)
        -- Preview hunk inline
        map("n", "<leader>ti", gitsigns.preview_hunk_inline)

        -- Toggle git blame
        map("n", "<leader>tb", function()
          gitsigns.blame_line({ full = true })
        end)

        -- Toggle deleted content in line
        map("n", "<leader>td", gitsigns.toggle_deleted)
        -- Toggle line differences in line
        map("n", "<leader>tw", gitsigns.toggle_word_diff)
      end,
    })
  end,
}
