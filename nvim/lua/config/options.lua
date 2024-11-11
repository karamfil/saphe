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

if vim.g.vscode then
    -- VSCode extension
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