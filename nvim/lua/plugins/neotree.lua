return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
        follow_current_file = {
          enabled = true,
        },
      },
      window = {
        width = 48,
      },
    })

    vim.keymap.set("n", "<leader>e", ":Neotree reveal left<CR>", {})
  end,
}
