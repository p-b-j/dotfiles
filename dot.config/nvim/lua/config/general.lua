vim.opt.signcolumn = "yes"
vim.g.mapleader = "g"
vim.opt["guicursor"] = ""

vim.wo.number = true

vim.opt.termguicolors = true

vim.keymap.set("n", "<S-Tab>", "<cmd>b#<cr>", { desc = "Switch to last buffer" })
