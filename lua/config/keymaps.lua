vim.keymap.set("n", "<leader>gs", "<cmd>G<cr>")
vim.keymap.set("n", "<leader>gc", "<cmd>Git add -A<bar>:Git commit<cr>")
vim.keymap.set("n", "<leader>gps", "<cmd>Git push<cr>")
vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<cr>")
vim.keymap.set("n", "<leader>gaps", "<cmd>Git submodule foreach --recursive git push<bar>:Git push<cr>")
vim.keymap.set("n", "<leader>gac", '<cmd>Git submodule foreach --recursive git commit -am "fix"<cr>')
vim.keymap.set("n", "<leader>gapl", "<cmd>:Git pull <bar> :Git submodule foreach --recursive git pull<cr>")
vim.keymap.set("n", "<leader>gop", "<cmd>Git -c push.default=current push<cr>")
