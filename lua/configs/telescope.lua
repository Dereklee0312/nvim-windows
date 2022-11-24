local present, telescope = pcall(require, "telescope")
local actions = require "telescope.actions"

if not present then
  return
end

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "normal",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center,
      },
    },
  },
  pickers = {
    live_grep = {
      initial_mode = "insert",
      mappings = {
        i = { ["<esc>"] = actions.close },
      },
    },
  },
}

telescope.setup(options)

-- Shorten function name
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Telescope
map("n", "<A-r>", ":Telescope find_files<CR>", opts)
map("n", "<A-f>", ":Telescope live_grep<CR>", opts)
-- load extensions
-- pcall(function()
--   for _, ext in ipairs(options.extensions_list) do
--     telescope.load_extension(ext)
--   end
-- end)
