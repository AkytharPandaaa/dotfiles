-- ------------------------------------------------------------
-- PROGRAMS
-- ------------------------------------------------------------

local fileManager = "thunar" -- "dolphin"
local spotlight = 'fuzzel --config="$HOME/.config/fuzzel/fuzzel.ini"'

-- ------------------------------------------------------------
-- KEYBINDS
-- ------------------------------------------------------------
-- https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- screenshots
hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.exec_cmd(
		"hyprshot "
			.. '--output-folder "'
			.. os.getenv("HOME")
			.. '/Bilder/Screenshots" '
			.. "--filename \"Screenshot $(date +'%Y-%m-%d at %H-%M-%S') - $(hyprctl activewindow | grep -Po '(?<=title: ).+' | sed 's!/!_!g').png\" "
			.. "--mode region "
			.. "--freeze"
	)
)

-- applications
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("kitty")) -- terminal
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- file manager
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(spotlight)) -- spotlight (program laucher)
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("vicinae toggle")) -- spotlight (program laucher)
-- bind = $mainMod, O, AI_Assistant

hl.bind(mainMod .. " + C", hl.dsp.window.close()) -- close active window

-- hyprland
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.window.float({ action = "toggle" })) -- float/tile switch
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.layout("togglesplit")) -- rotate splitted windows (dwindle)
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
