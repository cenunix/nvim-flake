local mocha = require('catppuccin.palettes').get_palette('mocha')

require('bufferline').setup {
  options = {
    indicator = {
      -- icon = '▎',
      style = 'underline', -- 'icon' | 'underline' | 'none'
    },
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Tree',
        separator = true,
        text_align = 'left',
      },
    },
    diagnostics = 'nvim_lsp',
    separator_style = { '', '' },
    modified_icon = '●',
    show_close_icon = false,
    show_buffer_close_icons = false,
  },

  highlights = require('catppuccin.groups.integrations.bufferline').get {
    custom = {
      all = {
        info = { fg = mocha.surface2 },
        info_diagnostic = { fg = mocha.surface2 },
        hint = { fg = mocha.surface2 },
        hint_diagnostic = { fg = mocha.surface2 },
        warning = { fg = mocha.surface2 },
        warning_diagnostic = { fg = mocha.surface2 },
        error = { fg = mocha.surface2 },
        error_diagnostic = { fg = mocha.surface2 },
        separator = { fg = mocha.base, bg = mocha.base },
        separator_visible = { fg = mocha.base, bg = mocha.base },
        separator_selected = { fg = mocha.base, bg = mocha.base },
      },
    },
  },
}
