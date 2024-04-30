local resession = require('resession')
resession.setup {
  autosave = {
    enabled = true,
    interval = 60,
    notify = true,
  },
}

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    -- Always save a special session named "last"
    resession.save('last')
  end,
})
