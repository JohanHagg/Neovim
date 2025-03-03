-- return {
--     "lunarvim/darkplus.nvim",
--     config = function()
--         vim.cmd("colorscheme darkplus")
--     end,
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      -- Options: latte, frappe, macchiato, mocha
      flavour = "mocha",
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
