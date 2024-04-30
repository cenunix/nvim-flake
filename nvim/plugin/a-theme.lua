local hl = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end
local cp = require('catppuccin.palettes').get_palette()
require('catppuccin').setup {
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  background = {     -- :h background
    light = 'latte',
    dark = 'mocha',
  },
  transparent_background = true, -- disables setting the background color.
  term_colors = true,
  styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { 'italic' },     -- Change the style of comments
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    mocha = {
      base = '#07070b',
      mantle = '#07070b',
      crust = '#07070b',
    },
  },
  custom_highlights = {
    -- Comment = { fg = colors.flamingo },
    -- TabLineSel = { bg = colors.pink },
    -- CmpBorder = { fg = "#07070b" },
    Pmenu = { bg = '#07070b' },
  },
  integrations = {
    alpha = true,
    cmp = true,
    gitsigns = true,
    neotree = true,
    treesitter = true,
    notify = true,
    navic = true,
    noice = true,
    mini = {
      enabled = true,
      indentscope_color = '',
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
}
--local mocha = require('catppuccin.palettes').get_palette 'mocha'
-- =========================
-- UI Elements
-- =========================
--vim.api.nvim_set_hl(0, 'Pmenu', { bg = mocha.surface0 })
--vim.api.nvim_set_hl(0, 'PmenuSel', { fg = mocha.text, bg = mocha.surface1, bold = true })
--vim.api.nvim_set_hl(0, 'NormalFloat', { bg = mocha.surface0 })
vim.cmd.colorscheme('catppuccin')
-- Custom Highlight Group
hl('Normal', { bg = nil })
hl('NormalNC', { link = 'Normal' })
hl('NormalFloat', { bg = nil })
hl('FloatBorder', { bg = nil, fg = '#313244' })
hl('FloatTitle', { bg = nil })
-- hl('LineNr', { fg = '#45475a' })
hl('CursorLine', { bg = nil, bold = false })
-- hl('CursorLineNr', { fg = 'White', bg = nil })
hl('WinSeparator', { fg = '#313244', bg = nil, bold = true })

hl('GitSignsAdd', { fg = '#a6e3a1' })
hl('GitSignsChange', { fg = '#f9e2af' })
hl('GitSignsDelete', { fg = '#e64553' })
hl('DiffAdd', { fg = nil, bg = '#23384C' })
hl('DiffChange', { fg = nil, bg = '#232C4C' })
hl('DiffDelete', { fg = nil, bg = '#341C28' })
hl('DiffText', { bg = '#33406B', bold = true })
hl('diffAdded', { fg = '#40a02b' })
hl('diffRemoved', { fg = '#d20f39' })
hl('diffChanged', { fg = '#df8e1d' })
hl('DiffText', { bg = '#3C2E10', bold = true })

-- Lazy nvim
hl('LazyNormal', { bg = '#181825' })

-- Telescope Theme
hl('TelescopeNormal', { bg = nil })
hl('TelescopePreviewNormal', { bg = nil })
hl('TelescopeResultsNormal', { bg = nil })
hl('TelescopeBorder', { bg = '#181825' })
hl('TelescopePreviewBorder', { fg = '#181825', bg = nil })
hl('TelescopePromptBorder', { fg = '#181825', bg = nil })
hl('TelescopeResultsBorder', { fg = '#181825', bg = nil })
hl('TelescopeTitle', { fg = '#181825', bg = '#89b4fa' })
hl('TelescopePreviewTitle', { fg = '#181825', bg = '#89b4fa' })
hl('TelescopePromptNormal', { bg = nil })
hl('TelescopePromptTitle', { fg = '#181825', bg = '#89b4fa' })
hl('TelescopePromptCounter', { fg = '#89b4fa', bg = nil })
hl('TelescopePromptPrefix', { fg = '#89b4fa', bg = nil })

-- Neotree
hl('NeoTreeFloatBorder', { fg = '#cdd6f4', bg = nil })
hl('NeoTreeFloatTitle', { fg = '#cdd6f4', bg = nil })
-- hl("NeoTreeNormal", {bg = "#181825"})

-- git-messenger
hl('gitMessengerPopupNormal', { link = 'NormalFloat' })

-- nvim-navic
hl('NavicText', { fg = '#cdd6f4' })

-- Lsp color
hl('LspSignatureActiveParameter', { bg = nil, fg = 'white', bold = true, italic = true })

-- fidget.nvim
hl('FidgetTitle', { fg = '#04a5e5', bg = 'NONE' })
hl('FidgetTask', { fg = '#cdd6f4', bg = 'NONE' })

-- nvim-notify
-- hl('NotifyERRORBody', { bg = 'NONE' })
-- hl('NotifyERRORBorder', { bg = 'NONE', fg = '#e64553' })
-- hl('NotifyWARNBody', { bg = 'NONE' })
-- hl('NotifyWARNBorder', { bg = 'NONE', fg = '#f9e2af' })
-- hl('NotifyINFOBody', { bg = 'NONE' })
-- hl('NotifyINFOBorder', { bg = 'NONE', fg = '#89dceb' })
-- hl('NotifyDEBUGBody', { bg = 'NONE' })
-- hl('NotifyDEBUGBorder', { bg = 'NONE', fg = '#eba0ac' })
-- hl('NotifyTRACEBody', { bg = 'NONE' })
-- hl('NotifyTRACEBorder', { bg = 'NONE', fg = '#a6e3a1' })

-- noice
hl('NoiceMini', { bg = 'none' })
hl('NoiceLspProgressTitle', { bg = nil, fg = '#cdd6f4' })
-- hl('NotificationInfo', { fg = '#89dceb', bg = nil })
-- hl('NotificationError', { fg = '#e64553', bg = nil })
-- hl('NotificationWarning', { fg = '#f9e2af', bg = nil })

-- disable vertical split
-- cmd("autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE")

vim.g.markdown_folding_disabled = 1
vim.g.markdown_conceal = 1
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
