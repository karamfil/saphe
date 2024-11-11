-- Set leader before loading "lazy"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require("hardtime").setup()


vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- set smarttab autoindent nosmartindent
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = false

-- set nobackup nowritebackup noswapfile
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- set ignorecase smartcase incsearch hlsearch
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Set Undo directory
vim.opt.undodir = vim.fn.stdpath('config') .. '/.undo//'


-- Hardtime
-- let g:hardtime_default_on = 1
-- let g:hardtime_showmsg = 1
-- let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]

-- if executable('rg')
--   let g:ackprg = 'rg --vimgrep'
-- endif

-- 
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

-- Easymotion
vim.keymap.set("n", "s", "<leader>(easymotion-prefix)")

-- Substitute
vim.keymap.set("n", "s", "<plug>(SubversiveSubstitute)")
vim.keymap.set("n", "ss", "<plug>(SubversiveSubstituteLine)")
vim.keymap.set("n", "S", "<plug>(SubversiveSubstituteToEndOfLine)")


if vim.g.vscode then
    -- VSCode extension

    -- Use VSCode's builtin commenting -- TODO use tpope/vim-commentary pluging for stanard Neovim
    vim.keymap.set("x", "gc", "<plug>VSCodeCommentary")
    vim.keymap.set("n", "gc", "<plug>VSCodeCommentary")
    vim.keymap.set("o", "gc", "<plug>VSCodeCommentary")
    vim.keymap.set("n", "gcc", "<plug>VSCodeCommentaryLine")
else
    -- ordinary Neovim
    --   colorscheme sunburst
    --   set background=dark
    --   set termguicolors

    --   set listchars=tab:→\ ,nbsp:␣,trail:•,extends:»,precedes:«

    --   " Make vim use the system clipboard:
    --   set mouse=a

    --   " Gives you a little jazzy info on the bottom:
    --   set title ruler

    --   " Enable hidden buffers
    --   set hidden

    --   " Reload files changed outside automatically
    --   " set autoread
end


-- Repeatable Motions / TODO move these on its own separate file
-- repeat the last [count]motion or the last zap-key:
-- map <expr> ; repmo#LastKey(';')|sunmap ;
-- map <expr> , repmo#LastRevKey(',')|sunmap ,

-- " add these mappings when repeating with `;' or `,':
-- noremap <expr> f repmo#ZapKey('f')|sunmap f
-- noremap <expr> F repmo#ZapKey('F')|sunmap F
-- noremap <expr> t repmo#ZapKey('t')|sunmap t
-- noremap <expr> T repmo#ZapKey('T')|sunmap T

-- " map a motion and its reverse motion:
-- noremap <expr> k repmo#SelfKey('k', 'j')|sunmap k
-- noremap <expr> j repmo#SelfKey('j', 'k')|sunmap j
-- noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
-- noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l
-- noremap <expr> w repmo#SelfKey('w', 'b')|sunmap w
-- noremap <expr> b repmo#SelfKey('b', 'w')|sunmap b
-- noremap <expr> e repmo#SelfKey('e', 'ge')|sunmap e
-- noremap <expr> ge repmo#SelfKey('ge', 'e')|sunmap ge
-- noremap <expr> E repmo#SelfKey('E', 'gE')|sunmap E
-- noremap <expr> gE repmo#SelfKey('gE', 'E')|sunmap gE

-- " TODO think about settings C-o as reverse
-- noremap <expr> ( repmo#SelfKey('(', ')')|sunmap (
-- noremap <expr> ) repmo#SelfKey(')', '(')|sunmap )
-- noremap <expr> { repmo#SelfKey('{', '}')|sunmap {
-- noremap <expr> } repmo#SelfKey('}', '{')|sunmap }

-- " Method
-- noremap <expr> [m repmo#SelfKey('[m', ']m')|sunmap [m
-- noremap <expr> ]m repmo#SelfKey(']m', '[m')|sunmap ]m
-- noremap <expr> [M repmo#SelfKey('[M', ']M')|sunmap [M
-- noremap <expr> ]M repmo#SelfKey(']M', '[M')|sunmap ]M

-- " Comment
-- noremap <expr> [* repmo#SelfKey('[*', ']*')|sunmap [*
-- noremap <expr> ]* repmo#SelfKey(']*', '[*')|sunmap ]*


-- " Easy Align
-- " Start interactive EasyAlign in visual mode (e.g. vipga)
-- xmap ga <Plug>(EasyAlign)

-- " Start interactive EasyAlign for a motion/text object (e.g. gaip)
-- nmap ga <Plug>(EasyAlign)