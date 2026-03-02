
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })

require("neo-tree").setup({})
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

