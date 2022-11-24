local set = vim.opt
CMDHEIGHT = 0

set.swapfile = false                         -- Don't use swapfile
set.updatetime = 0                           -- Faster completion
set.encoding="utf-8"                         -- The encoding displayed
set.fileencoding="utf-8"                     -- The encoding written to file
set.smartindent = true                       -- Makes indenting smart
set.iskeyword:append("-")                    -- Treat dash separated words as a word text object"
set.smarttab = true                          -- Makes tabbing smarter will realize you have 2 vs 4
set.expandtab = true                         -- Converts tabs to spaces
set.autoindent = true                        -- Good auto indent
set.autochdir = true                         -- Your working directory will always be the same as your working directory
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4                           -- Change the number of space characters inserted for indentation
set.incsearch = true                         -- Sets incremental search
set.mouse = 'a'
set.wrap = false

set.splitbelow = true                        -- Horizontal splits will automatically be below
set.splitright = true                        -- Vertical splits will automatically be to the right
set.termguicolors = true                     -- Set term gui colors (most terminals support this)
set.cmdheight = 0                            -- More space for displaying messages
set.relativenumber = true
set.number = true
