return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'SmiteshP/nvim-navbuddy',
      dependencies = {
        'SmiteshP/nvim-navic',
        'MunifTanjim/nui.nvim',
      },
      opts = { lsp = { auto_attach = true } },
      config = function()
        local navbuddy = require("nvim-navbuddy")
        local actions = require("nvim-navbuddy.actions")

        navbuddy.setup {
          window = {
            border = "single",
            size = "100%",
            position = "50%",
            scrolloff = nil,
            sections = {
              left = { size = "20%", border = nil },
              mid = { size = "40%", border = nil },
              right = { border = nil, preview = "leaf" }
            },
          },
          node_markers = {
            enabled = true,
            icons = {
              leaf = "  ",
              leaf_selected = " → ",
              branch = " ",
            },
          },
          icons = {
            File          = "󰈙 ",
            Module        = " ",
            Namespace     = "󰌗 ",
            Package       = " ",
            Class         = "󰌗 ",
            Method        = "󰆧 ",
            Property      = " ",
            Field         = " ",
            Constructor   = " ",
            Enum          = "󰕘",
            Interface     = "󰕘",
            Function      = "󰊕 ",
            Variable      = "󰆧 ",
            Constant      = "󰏿 ",
            String        = " ",
            Number        = "󰎠 ",
            Boolean       = "◩ ",
            Array         = "󰅪 ",
            Object        = "󰅩 ",
            Key           = "󰌋 ",
            Null          = "󰟢 ",
            EnumMember    = " ",
            Struct        = "󰌗 ",
            Event         = " ",
            Operator      = "󰆕 ",
            TypeParameter = "󰊄 ",
          },
          use_default_mappings = true,
          mappings = {
            ["<esc>"] = actions.close(),
            ["q"] = actions.close(),
            ["j"] = actions.next_sibling(),
            ["k"] = actions.previous_sibling(),
            ["h"] = actions.parent(),
            ["l"] = actions.children(),
            ["0"] = actions.root(),
            ["v"] = actions.visual_name(),
            ["V"] = actions.visual_scope(),
            ["y"] = actions.yank_name(),
            ["Y"] = actions.yank_scope(),
            ["i"] = actions.insert_name(),
            ["I"] = actions.insert_scope(),
            ["a"] = actions.append_name(),
            ["A"] = actions.append_scope(),
            ["r"] = actions.rename(),
            ["d"] = actions.delete(),
            ["f"] = actions.fold_create(),
            ["F"] = actions.fold_delete(),
            ["c"] = actions.comment(),
            ["<enter>"] = actions.select(),
            ["o"] = actions.select(),
            ["J"] = actions.move_down(),
            ["K"] = actions.move_up(),
            ["s"] = actions.toggle_preview(),
            ["<C-v>"] = actions.vsplit(),
            ["<C-s>"] = actions.hsplit(),
            ["t"] = actions.telescope({
              layout_config = {
                height = 0.90,
                width = 0.90,
                prompt_position = "top",
                preview_width = 0.50
              },
              layout_strategy = "horizontal"
            }),
            ["g?"] = actions.help(),
          },
          lsp = {
            auto_attach = false,
            preference = nil,
          },
          source_buffer = {
            follow_node = true,
            highlight = true,
            reorient = "smart",
            scrolloff = nil
          },
          custom_hl_group = nil,
        }
      end,
    },
  },
  -- your lsp config or other stuff
}
