-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.keymap.set("n", "<C-h>", ":tabr<cr>", { desc = "open left tab" })
vim.keymap.set("n", "<C-l>", ":tabl<cr>", { desc = "open right tab" })
vim.keymap.set("n", "<C-n>", ":tabnew<cr>", { desc = "open new tab" })

vim.keymap.set("n", "<C-s>", ":w<cr>", {})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("i", "<CapsLock>", "<Esc>", { expr = true, silent = true, desc = "esc" })
vim.keymap.set("n", ";", ":", { desc = "remap" })

vim.g.lazyvim_check_order = false
