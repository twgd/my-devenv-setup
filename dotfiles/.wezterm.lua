-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = true
config.tab_max_width = 40
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- my coolnight colorscheme:
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
	tab_bar = {
		background = "#011423",
		active_tab = {
			bg_color = "#033259",
			fg_color = "#CBE0F0",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#011423",
			fg_color = "#CBE0F0",
			intensity = "Half",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab_hover = {
			bg_color = "#033259",
			fg_color = "#CBE0F0",
			italic = false,
		},
		new_tab = {
			bg_color = "#011423",
			fg_color = "#214969",
		},
		new_tab_hover = {
			bg_color = "#033259",
			fg_color = "#CBE0F0",
		},
	},
}

-- and finally, return the configuration to wezterm
config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

return config
