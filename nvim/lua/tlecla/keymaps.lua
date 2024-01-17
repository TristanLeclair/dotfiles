local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
vim.keymap.set("n","<C-h>", "<C-w>h", opts )
vim.keymap.set("n","<C-j>", "<C-w>j", opts )
vim.keymap.set("n","<C-k>", "<C-w>k", opts )
vim.keymap.set("n","<C-l>", "<C-w>l", opts )

-- Save and quit
vim.keymap.set("n","<leader>w", ":update<cr>", opts )
vim.keymap.set("n","<leader>q", ":confirm q<cr>", opts )

-- Better file naviagtion
vim.keymap.set("n","<C-d>", "<C-d>zz", opts )
vim.keymap.set("n","<C-u>", "<C-u>zz", opts )
vim.keymap.set("n","n", "nzzzv", opts )
vim.keymap.set("n","N", "Nzzzv", opts )

-- Netrw
vim.keymap.set("n","<Leader>pv", ":Ex<CR>", opts )

-- Clear search highlighting
vim.keymap.set("n","<leader>h", ":noh<CR>", opts )

-- Don't skip wrapped part of line
vim.keymap.set("n","k", "gk", opts )
vim.keymap.set("n","j", "gj", opts )

-- Splits
vim.keymap.set("n","ss", ":split<CR>", opts )
vim.keymap.set("n","sv", ":vsplit<CR>", opts )
vim.keymap.set("n","sq", "<C-W>c", opts )

-- Incrementation
vim.keymap.set("n","+", "<C-a>", opts )
vim.keymap.set("n","-", "<C-x>", opts )

-- Resize with arrows
vim.keymap.set("n","<C-Up>", ":resize -2<CR>", opts )
vim.keymap.set("n","<C-Down>", ":resize +2<CR>", opts )
vim.keymap.set("n","<C-Left>", ":vertical resize -2<CR>", opts )
vim.keymap.set("n","<C-Right>", ":vertical resize +2<CR>", opts )

-- J
vim.keymap.set("n","J", "mzJ`z", opts )

-- Navigate buffers
vim.keymap.set("n","<S-l>", ":bnext<CR>", opts )
vim.keymap.set("n","<S-h>", ":bprevious<CR>", opts )

-- Insert --
-- Press jk fast to exit insert mode
vim.keymap.set("i","jk", "<ESC>", opts )

-- Visual --
-- Stay in indent mode
vim.keymap.set("v","<", "<gv", opts )
vim.keymap.set("v",">", ">gv", opts )

-- Move text up and down
vim.keymap.set("v","J", ":m '>+1<CR>gv=gv", opts )
vim.keymap.set("v","K", ":m '<-2<CR>gv=gv", opts )
vim.keymap.set("v","p", '"_dP', opts )
