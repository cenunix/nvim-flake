local mode_map = {
  ['n'] = '',
  ['no'] = '',
  ['nov'] = '',
  ['noV'] = '',
  ['no�'] = '',
  ['niI'] = '',
  ['niR'] = '',
  ['niV'] = '',
  ['nt'] = '',
  ['v'] = '',
  ['vs'] = '',
  ['V'] = '',
  ['Vs'] = '',
  ['�'] = '',
  ['�s'] = '',
  ['s'] = '',
  ['S'] = '',
  ['�'] = '',
  ['i'] = '',
  ['ic'] = '',
  ['ix'] = '',
  ['R'] = '',
  ['Rc'] = '',
  ['Rx'] = '',
  ['Rv'] = '',
  ['Rvc'] = '',
  ['Rvx'] = '',
  ['c'] = '',
  ['cv'] = '',
  ['ce'] = '',
  ['r'] = '',
  ['rm'] = '',
  ['r?'] = '',
  ['!'] = '',
  ['t'] = '',
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {
      function()
        return mode_map[vim.api.nvim_get_mode().mode] or '__'
      end,
    },
    lualine_b = { 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
