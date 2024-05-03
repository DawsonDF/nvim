local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local map = vim.keymap.set
local set = vim.opt
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- set leader key 
vim.g.mapleader = ","

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{import = "plugins"}
})

vim.cmd.colorscheme "moonfly"
local builtin = require('telescope.builtin')

-- CUSTOM KEYBINDS

-- Telescope
map('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- COC (Conquer of Completion)
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)


