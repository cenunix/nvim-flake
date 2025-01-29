local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
require('conform').setup {
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    nix = { 'nixfmt' },
    lua = { 'stylua' },
    javascript = { 'prettierd' },
    python = { 'isort' 'black' },
  },
}
require('lint').linters_by_ft = {
  markdown = { 'vale' },
  nix = { 'deadnix' },
  javascript = { 'eslint_d' },
  tsx = { 'eslint_d' },
}
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require('lint').try_lint()

    -- You can call `try_lint` with a linter name or a list of names to always
    -- run specific linters, independent of the `linters_by_ft` configuration
    -- require('lint').try_lint('cspell')
  end,
})
-- require('null-ls').setup {
--   sources = {
--     require('null-ls').builtins.formatting.nixfmt,
--     require('null-ls').builtins.formatting.stylua,
--     require('null-ls').builtins.formatting.prettierd,
--     require('null-ls').builtins.formatting.black,
--     require('null-ls').builtins.formatting.isort,
--     require('null-ls').builtins.formatting.qmlformat.with {
--       extra_args = { '-w 2' },
--     },
--     require('null-ls').builtins.diagnostics.eslint_d,
--     require('null-ls').builtins.diagnostics.deadnix,
--   },
--   on_attach = function(client, bufnr)
--     if client.supports_method('textDocument/formatting') then
--       vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format { async = false }
--         end,
--       })
--     end
-- end,
-- }
