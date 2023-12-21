vim.lsp.start({
  name = 'typescript LSP',
  cmd = {'typescript-language-server --stdio'},
  root_dir = '/workspace'
})
vim.lsp.start({
  name = 'tailwind LSP',
  cmd = {'tailwindcss-language-server --stdio'},
  root_dir = '/workspace'
})
