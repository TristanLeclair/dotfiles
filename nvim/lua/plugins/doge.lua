local M = {
	"kkoomen/vim-doge",
	event = "BufRead",
}

function M.config()
	vim.cmd([[call doge#install()]])
end

return M
