-- ------------------------------------------------------------
-- AUTOSTART
-- ------------------------------------------------------------

hl.on("hyprland.start", function()
	local socket = require("socket")

	-- services - hyperland
	hl.exec_cmd("systemctl --user start hyprpolkitagent") -- GUI root password prompt
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- stores only text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- stores only image data
	--hl.exec_cmd("swaync") -- notifications
	--hl.exec_cmd("waybar") -- top info bar
	hl.exec_cmd("ashell") -- top info bar
	hl.exec_cmd("hyprpaper") -- wallpapers

	-- ssh-agent
	hl.exec_cmd("ssh-agent -D -a $SSH_AUTH_SOCK")

	-- services - kde
	hl.exec_cmd("/usr/lib/pam_kwallet_init &") --  KWallet Password store
	hl.exec_cmd("balooctl6 disable") --  KDE file indexer (disable)

	-- background services
	hl.exec_cmd("syncthing") -- file sync
	hl.exec_cmd("nextcloud") -- file sync
	hl.exec_cmd("steam -silent") -- steam
	-- hl.exec_cmd("discord --start-minimized", { workspace = "5 silent" })

	-- disable DnD
	--hl.exec_cmd("swaync-client -df")

	-- apps
	-- hl.exec_cmd("thunderbird")
	-- hl.exec_cmd("ferdium")
	hl.exec_cmd("deltachat-desktop", { workspace = "4 silent" })
	hl.exec_cmd("keepassxc", { workspace = "1" })

	-- delayed services
	socket.sleep(10)
	hl.exec_cmd("uxplay") -- AirPlay server
	hl.exec_cmd("Telegram", { workspace = "4 silent" }) -- messages

	-- notification service fix:
	hl.exec_cmd("killall swaync")
end)
