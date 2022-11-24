local present, nvimtree = pcall(require, "nvim-tree")

if not present then
    return
end

local options = {
    filters = {
        dotfiles = false,
        exclude = {vim.fn.stdpath "config" .. "/lua/custom"}
    },
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {"alpha"},
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false
    },
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
    view = {
        adaptive_size = true,
        side = "left",
        width = 25,
        hide_root_folder = true
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = false
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    filesystem_watchers = {
        enable = true
    },
    actions = {
        open_file = {
            resize_window = true
        }
    },
    renderer = {
        highlight_git = false,
        highlight_opened_files = "all",

        indent_markers = {
            enable = false
        },

        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true
            },

            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = ""
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                }
            }
        }
    }
}

-- check for any override
nvimtree.setup(options)

local map = vim.keymap.set
local opts = {
    noremap = true,
    silent = true
}
local term_opts = {
    silent = true
}

-- Mapping to open the tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
