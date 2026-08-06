-- ------------------------------------------------------------
-- INPUT
-- ------------------------------------------------------------

hl.config({
	input = {
		kb_layout = "de",

		numlock_by_default = true,

		repeat_rate = 25,
		repeat_delay = 600,

		sensitivity = 0.0,
		accel_profile = "flat",
		natural_scroll = false,

		follow_mouse = 1,

		focus_on_close = 1,

		touchpad = {
			disable_while_typing = true,

			natural_scroll = true,
			tap_to_click = true,
		},

		tablet = { -- device: wacom intuos s pen
			-- TODO: move into devices file
			transform = 0,
			output = "DP-2",
		},
	},
})
