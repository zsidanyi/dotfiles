local status, rendermarkdown = pcall(require, 'render-markdown')
if (not status) then
  print("render-markdown is not available")
  return
end

rendermarkdown.setup({
    --pipe_table = { style = 'round' },
    --heading = { position = 'inline' },
})
