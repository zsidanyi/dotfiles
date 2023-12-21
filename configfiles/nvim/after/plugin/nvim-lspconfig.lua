local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then
  print("lspconfig is not available")
  return
end

lspconfig.clangd.setup{}
lspconfig.tsserver.setup{}
lspconfig.tailwindcss.setup{}
