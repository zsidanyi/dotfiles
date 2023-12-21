vim.lsp.start({
  name = 'typescript LSP',
  cmd = {'typescript-language-server --stdio'},
  root_dir = '/workspace'
})
