vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.number = true
vim.keymap.set("n", "<Space>", "<Nop>")
vim.g.mapleader = " "

vim.opt.swapfile = false

-- swapline
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = 'move line down' })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = 'move line up' })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = 'move line down' })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = 'move line up' })

-- JK
vim.keymap.set("i", "jk", "<Esc>l")
vim.keymap.set("i", "kj", "<Esc>l")
vim.keymap.set("i", "JK", "<Esc>l")
vim.keymap.set("i", "KJ", "<Esc>l")
vim.keymap.set("i", "jK", "<Esc>l")
vim.keymap.set("i", "Kj", "<Esc>l")
vim.keymap.set("i", "Jk", "<Esc>l")
vim.keymap.set("i", "kJ", "<Esc>l")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'in x mode [["_dP]]' })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'Sync yank to clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Sync yank to clipboard' })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'Delete whithout put in clip' })
