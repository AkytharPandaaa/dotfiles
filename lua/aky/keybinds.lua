-- PROGRAMS

local terminal = "kitty"
local fileManager = "thunar" -- "dolphin"
local launcher = 'fuzzel --config="$HOME/.config/fuzzel/fuzzel.ini"'
local screenshotArea =
	"hyprshot --output-folder \"Bilder/Screenshots\" --filename \"Screenshot $(date +'%Y-%m-%d at %H-%M-%S') - $(hyprctl activewindow | grep -Po '(?<=title: ).+' | sed 's!/!_!g').png\" --mode region --freeze"
local browser = "firefox"
local scad = "env QT_QPA_PLATFORM=xcb openscad"

-- KEYBINDS
