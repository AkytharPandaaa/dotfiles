-- ------------------------------------------------------------
-- AUTOSTART
-- ------------------------------------------------------------

hl.on("hyprland.start", function()
	-- services - hyperland
	hl.exec_cmd("systemctl --user start hyprpolkitagent") -- GUI root password prompt
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- stores only text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- stores only image data
	hl.exec_cmd("swaync") -- notifications
	--hl.exec_cmd("waybar") -- top info bar
	hl.exec_cmd("ashell") -- top info bar
	hl.exec_cmd("hyprpaper") -- wallpapers

	-- ssh-agent
	hl.exec_cmd("ssh-agent -D -a $SSH_AUTH_SOCK")

	-- services - kde
	hl.exec_cmd("/usr/lib/pam_kwallet_init &") --  KWallet Password store
	hl.exec_cmd("balooctl6 disable") --  KDE file indexer (disable)

	-- background services
	hl.exec_cmd("syncthing && nextcloud") -- file sync
	hl.exec_cmd("sleep 5 && uxplay") -- AirPlay server
	hl.exec_cmd("steam -silent && tauon") -- steam and music
	-- hl.exec_cmd("discord --start-minimized", { workspace = "5 silent" })

	-- disable DnD
	hl.exec_cmd("swaync-client -df")

	-- apps
	-- hl.exec_cmd("thunderbird && ferdium")
	hl.exec_cmd("deltachat-desktop", { workspace = "4 silent" })
	hl.exec_cmd("sleep 3 && Telegram", { workspace = "4 silent" })
	hl.exec_cmd("keepassxc", { workspace = "1" })
end)
