-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "AdventureTime"
config.color_scheme = "Catppuccin Frappe"
config.window_background_opacity = 0.85
config.text_background_opacity = 0.3

local act = wezterm.action
config.keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = act.SendString("\x1bb") },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = act.SendString("\x1bf") },
	-- Make Option-Shift-Right equivalent to Ctrl-e; end of line
	{ key = "RightArrow", mods = "OPT|SHIFT", action = act.SendKey({ key = "e", mods = "CTRL" }) },
	-- Make Option-Shift-Left equivalent to Ctrl-a; start of line
	{ key = "LeftArrow", mods = "OPT|SHIFT", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	-- Make Option-Shift-Backspace equivalent to Ctrl-u; delete line
	{ key = "Backspace", mods = "OPT|SHIFT", action = act.SendKey({ key = "u", mods = "CTRL" }) },
}

-- and finally, return the configuration to wezterm
return config
