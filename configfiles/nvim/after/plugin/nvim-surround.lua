local status, nvimsurround = pcall(require, 'nvim-surround')
if (not status) then
  print("nvim-surround is not available")
  return
end

nvimsurround.setup{}
