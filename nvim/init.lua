-- Use the .vimrc
vim.cmd('source ~/.vimrc')

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- only works if ripgrep is installed
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = {"lua", "javascript"},
  highlight = { enable = true },
  indent = { enable = true },
})

vim.keymap.set("n", "<C-n>", ":Neotree reveal left<CR>", {})

