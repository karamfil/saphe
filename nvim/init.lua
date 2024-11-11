-- Set leader before loading "lazy"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

require("config.options")
require("config.keymaps")

-- if executable('rg')
--   let g:ackprg = 'rg --vimgrep'
-- endif

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