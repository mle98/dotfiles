return {
    { -- Collection of various small independent plugins/modules
        'echasnovski/mini.nvim',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup { n_lines = 500 }

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()

            -- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            local statusline = require 'mini.statusline'
            -- set use_icons to true if you have a Nerd Font
            statusline.setup { use_icons = vim.g.have_nerd_font }

            -- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return '%2l:%-2v'
            end

            -- disable the keymaps here first, so i can manually enable them in visual mode only,
            -- since i also use the same one with harpoon in normal mode
            require('mini.move').setup({
                mappings = {
                    left  = '',
                    right = '',
                    down  = '',
                    up    = '',
                    line_left  = '',
                    line_right = '',
                    line_down  = '',
                    line_up    = '',
                }
            })

            vim.keymap.set("x", "<M-j>", function() require("mini.move").move_selection("down") end, { desc = "Move Down" })
            vim.keymap.set("x", "<M-k>", function() require("mini.move").move_selection("up") end, { desc = "Move Up" })
        end

    },
}
