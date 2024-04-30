local mocha = require('catppuccin.palettes').get_palette('mocha')
local styles = { 'bold', 'italic' }

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
        background = { bg = 'NONE' },
        buffer_visible = { fg = mocha.surface1, bg = 'NONE' },
        buffer_selected = { fg = mocha.text, bg = 'NONE', style = styles }, -- current
        duplicate_selected = { fg = mocha.text, bg = 'NONE', style = styles },
        duplicate_visible = { fg = mocha.surface1, bg = 'NONE', style = styles },
        duplicate = { fg = mocha.surface1, bg = 'NONE', style = styles },
        tab = { fg = mocha.surface1, bg = 'NONE' },
        tab_selected = { fg = mocha.sky, bg = 'NONE', bold = true },
        tab_separator = { fg = 'NONE', bg = 'NONE' },
        tab_separator_selected = { fg = 'NONE', bg = 'NONE' },
        info = { fg = mocha.surface2 },
        info_diagnostic = { fg = mocha.surface2 },
        hint = { fg = mocha.surface2, bg = 'NONE' },
        hint_diagnostic = { fg = mocha.surface2 },
        warning = { fg = mocha.yellow, bg = 'NONE' },
        warning_visible = { fg = mocha.yellow, bg = 'NONE' },
        warning_selected = { fg = mocha.yellow, bg = 'NONE', style = styles },
        warning_diagnostic = { fg = mocha.yellow, bg = 'NONE' },
        warning_diagnostic_visible = { fg = mocha.yellow, bg = 'NONE' },
        warning_diagnostic_selected = { fg = mocha.yellow, bg = 'NONE' },
        error = { fg = mocha.surface2, bg = 'NONE' },
        error_diagnostic = { fg = mocha.surface2 },
        separator = { fg = 'NONE', bg = 'NONE' },
        separator_visible = { fg = 'NONE', bg = 'NONE' },
        separator_selected = { fg = 'NONE', bg = 'NONE' },
        offset_separator = { fg = 'NONE', bg = 'NONE' },
        fill = { bg = 'NONE' },
      },
    },
  },
}
