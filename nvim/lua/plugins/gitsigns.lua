return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      -- (Currently disabled) To enable git blame inline
      current_line_blame = false,
    })
  end,
}
