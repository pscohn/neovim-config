

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then 
    local out = vim.fn.system({ 
        'git', 
        'clone', 
        '--filter=blob:none', 
        'https://github.com/folke/lazy.nvim.git', 
        '--branch=stable', -- latest stable release 
        lazypath, 
    })
    if vim.v.shell_error ~= 0 then
	    vim.api.nvim_echo({
	      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
	      { out, "WarningMsg" },
	      { "\nPress any key to exit..." },
	    }, true, {})
	    vim.fn.getchar()
	    os.exit(1)
	end
end 

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
        -- add your plugins here
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        }
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    -- checker = { enabled = true },
})

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.rnu = true -- relative line numbers


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })






