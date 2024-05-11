local map = function(key, action)
  vim.api.nvim_set_keymap("n", key, action, { noremap = true, silent = true })
end

local function neovim_command(cmd)
    vim.api.nvim_command(cmd)
end


map("<F12>", ":wq<CR>")
map("<F10>", ":w<CR>")
map("<F9>", ":q!<CR>")
map("<F8>", ":q<CR>")

map("<space>tt", ":terminal<CR>")


vim.api.nvim_set_keymap('n', '<space>al', ':botright vsplit<CR>:vertical resize +50<CR>:resize -10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>r', ':botright vsplit<CR>:resize -10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>b', ':split<CR>:resize +10<CR>', { noremap = true, silent = true })

map("<space>sf", ":Telescope find_files<CR>")

map("<space>ntt", ":NvimTreeToggle<CR>")
map("<space>ntf", ":NvimTreeFocus<CR>")

map("<space>st", ":TodoTelescope<CR>")

map("<space>mp", ":MarkdownPreviewToggle<CR>")
map("<space>mi", ":MakeitOpen<CR>")
