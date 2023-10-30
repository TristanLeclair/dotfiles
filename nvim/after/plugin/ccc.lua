local status_ok, ccc = pcall(require, "ccc")
if not status_ok then
	print("ccc not working/installed")
	return
end

ccc.setup()
