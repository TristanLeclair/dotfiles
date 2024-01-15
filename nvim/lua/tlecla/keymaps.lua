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
vim.keymap.set("n","<C-h>", "<C-w>h")
vim.keymap.set("n","<C-j>", "<C-w>j")
vim.keymap.set("n","<C-k>", "<C-w>k")
vim.keymap.set("n","<C-l>", "<C-w>l")

-- Save and quit
vim.keymap.set("n","<leader>w", ":update<cr>")
vim.keymap.set("n","<leader>q", ":q<cr>")

-- Better file naviagtion
vim.keymap.set("n","<C-d>", "<C-d>zz")
vim.keymap.set("n","<C-u>", "<C-u>zz")
vim.keymap.set("n","n", "nzzzv")
vim.keymap.set("n","N", "Nzzzv")

-- Netrw
vim.keymap.set("n","<Leader>pv", ":Ex<CR>")

-- Clear search highlighting
vim.keymap.set("n","sn", ":noh<CR>")

-- Don't skip wrapped part of line
vim.keymap.set("n","k", "gk")
vim.keymap.set("n","j", "gj")

-- Splits
vim.keymap.set("n","ss", ":split<CR>")
vim.keymap.set("n","sv", ":vsplit<CR>")
vim.keymap.set("n","sq", "<C-W>c")

-- Incrementation
vim.keymap.set("n","+", "<C-a>")
vim.keymap.set("n","-", "<C-x>")

-- Resize with arrows
vim.keymap.set("n","<C-Up>", ":resize -2<CR>")
vim.keymap.set("n","<C-Down>", ":resize +2<CR>")
vim.keymap.set("n","<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n","<C-Right>", ":vertical resize +2<CR>")

-- J
vim.keymap.set("n","J", "mzJ`z")

-- Navigate buffers
vim.keymap.set("n","<S-l>", ":bnext<CR>")
vim.keymap.set("n","<S-h>", ":bprevious<CR>")

-- Insert --
-- Press jk fast to exit insert mode
vim.keymap.set("i","jk", "<ESC>")

-- Visual --
-- Stay in indent mode
vim.keymap.set("v","<", "<gv")
vim.keymap.set("v",">", ">gv")

-- Move text up and down
vim.keymap.set("v","J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v","K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v","p", '"_dP')
