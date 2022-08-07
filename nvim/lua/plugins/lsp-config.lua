local U = require('utils')
local nvim_lsp = require'lspconfig'

nvim_lsp.pylsp.setup({
    on_attach=on_attach,
    settings = {
    pylsp = {
      plugins = {
        rope = { enabled = true },
        pyflakes = { enabled = true },
        pydocstyle = { enabled = true },
        yapf = { enabled = true },
        -- pylsp_mypy = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
})
nvim_lsp.rust_analyzer.setup({})
nvim_lsp.clangd.setup({
    filetypes = { "c", "cpp", "cc" },
})
nvim_lsp.texlab.setup({})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

U.map('n', '<C-d>', '<cmd>lua vim.lsp.buf.definition()<CR>')
U.map('n', '<C-h>', '<cmd>lua vim.lsp.buf.hover()<CR>')
U.map('n', '<C-i>', '<cmd>lua vim.lsp.buf.implementation()<CR>')
U.map('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
U.map('n', '<C-x>', '<cmd>lua vim.lsp.buf.references()<CR>')
U.map('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
U.map('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
U.map('n', '<C-e>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
U.map('n', '<C-f>', '<cmd>lua vim.lsp.buf.formatting()<CR>')
