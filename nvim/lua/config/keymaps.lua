-- map <ENTER> @@
vim.keymap.set("n", "<CR>", "@@")
-- cnoremap W w
vim.keymap.set("c", "W", "w", { noremap = true })
-- cnoremap Q q
vim.keymap.set("c", "Q", "q", { noremap = true })

-- nnoremap <C-e>  3<C-e>
-- vim.keymap.set("n", "<C-e>", "3<C-e>", { noremap = true })
-- nnoremap <C-y>  3<C-y>
-- vim.keymap.set("n", "<C-y>", "3<C-y>", { noremap = true })

if vim.g.vscode then
    -- VSCode extension

    -- Use VSCode's builtin commenting -- TODO use tpope/vim-commentary pluging for stanard Neovim
    vim.keymap.set("x", "gc", "<plug>VSCodeCommentary")
    vim.keymap.set("n", "gc", "<plug>VSCodeCommentary")
    vim.keymap.set("o", "gc", "<plug>VSCodeCommentary")
    vim.keymap.set("n", "gcc", "<plug>VSCodeCommentaryLine")
else
    -- Ordinary Neovim
end