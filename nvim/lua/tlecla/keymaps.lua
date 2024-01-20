--- Override vim.keymap.set to add a description to the keymap.
--- Examples:
--- <pre>lua
---   -- Set a keymap with a description
--    vim.keymap.set('n', 'lhs', 'rhs', { desc = 'Description' })
--  </pre>
--- @see set | vim.keymap.set()
function Set_keymap(mode, lhs, rhs, opts, desc)
  if desc then
    opts["desc"] = desc
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

local opts = { noremap = true, silent = true }

--Remap space as leader key
Set_keymap("", "<Space>", "<Nop>", opts)
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
Set_keymap("n", "<C-h>", "<C-w>h", opts)
Set_keymap("n", "<C-j>", "<C-w>j", opts)
Set_keymap("n", "<C-k>", "<C-w>k", opts)
Set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Save and quit
Set_keymap("n", "<leader>w", ":update<cr>", opts, "Save")
Set_keymap("n", "<leader>q", ":confirm q<cr>", opts, "Quit")

-- Better file naviagtion
Set_keymap("n", "<C-d>", "<C-d>zz", opts)
Set_keymap("n", "<C-u>", "<C-u>zz", opts)
Set_keymap("n", "n", "nzzzv", opts)
Set_keymap("n", "N", "Nzzzv", opts)

-- Netrw (disabled due to nvim-tree
-- set_keymap("n", "<Leader>pv", ":Ex<CR>", opts)

-- Clear search highlighting
Set_keymap("n", "<leader>h", ":noh<CR>", opts, "No highlight")

-- Don't skip wrapped part of line
Set_keymap("n", "k", "gk", opts)
Set_keymap("n", "j", "gj", opts)

-- Splits
Set_keymap("n", "ss", ":split<CR>", opts, "Horizontal split")
Set_keymap("n", "sv", ":vsplit<CR>", opts, "Vertical split")
Set_keymap("n", "sq", "<C-W>c", opts, "Close split")

-- Incrementation
Set_keymap("n", "+", "<C-a>", opts)
Set_keymap("n", "-", "<C-x>", opts)

-- Resize with arrows
Set_keymap("n", "<C-Up>", ":resize -2<CR>", opts)
Set_keymap("n", "<C-Down>", ":resize +2<CR>", opts)
Set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
Set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- J
Set_keymap("n", "J", "mzJ`z", opts)

-- Navigate buffers
Set_keymap("n", "<S-l>", ":bnext<CR>", opts)
Set_keymap("n", "<S-h>", ":bprevious<CR>", opts)
Set_keymap("n", "<leader>bd", ":bdelete<cr>", opts, "Delete buffer")

-- Insert --
-- Press jk fast to exit insert mode
Set_keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
Set_keymap("v", "<", "<gv", opts)
Set_keymap("v", ">", ">gv", opts)

-- Move text up and down
Set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
Set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
Set_keymap("v", "p", '"_dP', opts)

return Set_keymap
