-- ------------------------------------------------------------
-- THEME
-- ------------------------------------------------------------

local theme = require("themes.rose-pine.dist.rose-pine")
-- local theme = require("themes.rose-pine.dist.rose-pine-dawn")
-- local theme = require("themes.rose-pine.dist.rose-pine-moon")

-- ------------------------------------------------------------
-- GENERAL
-- ------------------------------------------------------------
-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.config({
	general = {
		border_size = 2,
		gaps_in = 2,
		gaps_out = 4,

		col = {
			active_border = {
				colors = {
					theme.rose,
					theme.pine,
					theme.love,
					theme.iris,
				},
				angle = 45,
			},
			inactive_border = theme.muted,
		},

		-- which layout to use. ["dwindle"/"master"/"scrolling"/"monocle"]
		layout = "dwindle",

		-- if true, will not fall back to the next available window when moving focus in a direction where no window was found
		no_focus_fallback = false,

		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true, -- false
		extend_border_grab_area = 15,
		hover_icon_on_border = true,

		allow_tearing = false,

		-- whether parent windows of modals will be interactive
		modal_parent_blocking = true,

		locale = "de_DE",
	},
})

-- ------------------------------------------------------------
-- DECORATION
-- ------------------------------------------------------------
-- https://wiki.hyprland.org/Configuring/Variables/#decoration

hl.config({
	rounding = 0, -- 0, 8, 12
	rounding_power = 2.0,

	-- opacity
	active_opacity = 1.0,
	inactive_opacity = 1.0,
	fullscreen_opacity = 1.0,

	-- dimming
	dim_modal = true,
	dim_inactive = false,
	dim_strength = 0.5,

	border_part_of_window = true,

	-- blur
	blur = {
		enabled = false, -- true
		size = 5,
		passes = 3,

		vibrancy = 0.1696,
	},

	-- shadow
	shadow = {
		enabled = false,
		range = 4,
		render_power = 3,
		color = theme.muted, -- rgba(1a1a1aee)
	},

	-- glow
	glow = { enabled = false },

	-- motion blur (on moving/resizing)
	motion_blur = { enabled = false },

	-- wobble (on moving/resizing)
	wobble = { enabled = false },
})

-- ------------------------------------------------------------
-- ANIMATIONS
-- ------------------------------------------------------------
-- https://wiki.hyprland.org/Configuring/Variables/#animations

hl.config({
	animations = {
		enabled = true,

		workspace_wraparound = true,
	},
})

-- ------------------------------------------------------------
-- DWINDLE
-- ------------------------------------------------------------
-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/

hl.config({
	dwindle = {
		force_split = 0,
		preserve_split = true,
		smart_split = true,
		smart_resizing = true,
	},
})

-- ------------------------------------------------------------
-- MISC
-- ------------------------------------------------------------
-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc

hl.config({
	misc = {
		force_default_wallpaper = 0, -- 0/1 to disable anime mascot wallpaper
		disable_hyprland_logo = false, -- true disables hyprland logo / anime girl background :(

		enable_anr_dialog = false, -- anr = Application not Responding

		font_family = "Lilex Nerd Font",

		focus_on_activate = false, -- false: focus requests are denied

		-- if enabled, windows will open on the workspace they were invoked on. 0 - disabled, 1 - single-shot, 2 - persistent (all children too)
		initial_workspace_tracking = 1,

		middle_click_paste = true,
	},
	cursor = {
		-- Hides the cursor when you press any key until the mouse is moved
		hide_on_key_press = true,
	},
	ecosystem = {
		-- donation panel
		no_donation_nag = true,
	},
})
