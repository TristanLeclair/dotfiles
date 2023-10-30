local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  print("Copilot not working/installed")
  return
end

copilot.setup()
