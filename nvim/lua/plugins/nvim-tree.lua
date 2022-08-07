local U = require('utils')

require('nvim-tree').setup({
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    view = {
        adaptive_size = true,
        side = 'left',
    },
    filters = {
        custom = { '.git', 'node_modules' },
    },
    open_on_setup = true,
    open_on_setup_file = true,
    actions = {
        open_file = {
            window_picker = {
                enable = true,
            }
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
            }
        }
    }
})

U.map('n', 'gt', '<CMD>NvimTreeFocus<CR>')
