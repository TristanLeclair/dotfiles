local default_opts = { noremap = true, silent = true }

--- Override vim.keymap.set to add a description to the keymap.
--- Examples:
--- <pre>lua
---   -- Set a keymap with a description
--    vim.keymap.set('n', 'lhs', 'rhs', { desc = 'Description' })
--  </pre>
--- @see set | vim.keymap.set()
--- @param mode string|table
---@param lhs string
---@param rhs string|function
---@param desc string|nil description of operation
---@param opts table|nil default = { noremap = true, silent = true }
function Set_keymap(mode, lhs, rhs, desc, opts)
  if not opts then
    opts = default_opts
  end

  if desc then
    opts["desc"] = desc
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

--Remap space as leader key
Set_keymap("", "<Space>", "<Nop>")
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
Set_keymap("n", "<C-h>", "<C-w>h")
Set_keymap("n", "<C-j>", "<C-w>j")
Set_keymap("n", "<C-k>", "<C-w>k")
Set_keymap("n", "<C-l>", "<C-w>l")

-- Save and quit
Set_keymap("n", "<leader>w", ":update<cr>", "Save")
Set_keymap("n", "<leader>q", ":confirm qa<cr>", "Quit all")

-- Better file naviagtion
Set_keymap("n", "<C-d>", "<C-d>zz")
Set_keymap("n", "<C-u>", "<C-u>zz")
Set_keymap("n", "n", "nzzzv")
Set_keymap("n", "N", "Nzzzv")

-- Netrw (disabled due to nvim-tree
-- set_keymap("n", "<Leader>pv", ":Ex<CR>", opts)

-- Clear search highlighting
Set_keymap("n", "<leader>h", ":noh<CR>", "No highlight")

-- Don't skip wrapped part of line
Set_keymap("n", "k", "gk")
Set_keymap("n", "j", "gj")

-- Splits
Set_keymap("n", "<leader>ss", ":split<CR>", "Horizontal split")
Set_keymap("n", "<leader>sv", ":vsplit<CR>", "Vertical split")
Set_keymap("n", "<leader>sq", "<C-W>q", "Close split")

-- Incrementation
Set_keymap("n", "+", "<C-a>")
Set_keymap("n", "-", "<C-x>")

-- Resize with arrows
Set_keymap("n", "<C-Up>", ":resize -2<CR>")
Set_keymap("n", "<C-Down>", ":resize +2<CR>")
Set_keymap("n", "<C-Left>", ":vertical resize -2<CR>")
Set_keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- J
Set_keymap("n", "J", "mzJ`z")

-- Navigate buffers
Set_keymap("n", "<S-l>", ":bnext<CR>")
Set_keymap("n", "<S-h>", ":bprevious<CR>")
Set_keymap("n", "<leader>bd", ":bp|bd #<cr>", "Delete buffer")

-- Insert --
-- Press jk fast to exit insert mode
Set_keymap("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
Set_keymap("x", "<", "<gv")
Set_keymap("x", ">", ">gv")

-- Move text up and down
Set_keymap("x", "J", ":m '>+1<CR>gv=gv")
Set_keymap("x", "K", ":m '<-2<CR>gv=gv")
Set_keymap("x", "p", '"_dP')

return Set_keymap
