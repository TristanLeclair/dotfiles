-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("Hack NFM")
config.default_prog = { "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" }

print(config.default_prog)
config.color_scheme = "catppuccin-mocha"
config.window_background_opacity = 0.72

config.disable_default_key_bindings = true
local keymaps = require("config.lua.keymaps")
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keymaps.keys
config.key_tables = keymaps.key_tables

-- setup events
require("config.lua.events")

-- and finally, return the configuration to wezterm
return config
