-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del

-- Built-In
unmap("n", "<leader>gg")
unmap("n", "<leader>gG")
unmap("n", "<leader>gL")
unmap("n", "<leader>gb")
unmap("n", "<leader>gf")
unmap("n", "<leader>gl")
unmap({"n", "v"}, "<leader>gB")
unmap({"n", "v"}, "<leader>gY")
-- unmap("n", "<leader>gc")
-- unmap("n", "<leader>gd")
-- unmap("n", "<leader>ge")
-- unmap("n", "<leader>gs")
-- unmap("n", "<leader>gS")

-- Search Git Repo
map({"n", "v"}, "<leader>G", ":exec 'vimgrep /'.expand('<cword>').'/j '.fnameescape(fnamemodify(finddir('.git', escape(expand('%:p:h'), ' ').';'), ':h')).'/**/*.java' <Bar> cw<CR>")
