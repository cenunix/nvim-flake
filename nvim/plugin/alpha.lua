local alpha = require('alpha')
local icons = require('lua.lua.user.icons')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
  [[                                                                     ]],
  [[       ███████████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      ████████████████ ███████████ ███   ███████     ]],
  [[     ████████████████ ████████████ █████ ██████████████   ]],
  [[    ██████████████    █████████████ █████ █████ ████ █████   ]],
  [[  ██████████████████████████████████ █████ █████ ████ █████  ]],
  [[ ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
}
dashboard.section.buttons.val = {
  dashboard.button('e', icons.ui.NewFile .. 'New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('q', icons.ui.SignOut .. 'Quit NVIM', ':qa<CR>'),
}
local handle = io.popen('fortune')
local fortune = handle:read('*a')
handle:close()
dashboard.section.footer.val = fortune

dashboard.config.opts.noautocmd = true

vim.cmd([[autocmd User AlphaReady echo 'ready']])

alpha.setup(dashboard.config)
