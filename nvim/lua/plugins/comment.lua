-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      toggler = {
        line = "<leader>7",
      },
      opleader = {
        line = "<leader>7",
      },
    })
  end,
  lazy = false,
}
