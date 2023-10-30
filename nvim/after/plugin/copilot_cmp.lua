local status_ok, copilot_cmp = pcall(require, "copilot_cmp")
if not status_ok then
  print("copilot_cmp not working/installed")
  return
end

copilot_cmp.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
