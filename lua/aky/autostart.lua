-- ------------------------------------------------------------
-- AUTOSTART
-- ------------------------------------------------------------

hl.on("hyprland.start", function()
	-- services - hyperland
	hl.exec_cmd("systemctl --user start hyprpolkitagent") -- GUI root password prompt
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- stores only text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- stores only image data
	hl.exec_cmd("swaync") -- notifications
	hl.exec_cmd("waybar") -- top info bar
	hl.exec_cmd("hyprpaper") -- wallpapers

	-- services - kde
	hl.exec_cmd("/usr/lib/pam_kwallet_init &") --  KWallet Password store
	hl.exec_cmd("balooctl6 disable") --  KDE file indexer (disable)

	-- window rules for autostart
	-- hl.window_rule({ name = "discord", match = { class = "^(discord)$" }, workspace = "5 silent" })
	-- hl.window_rule({ name = "deltachat", match = { class = "^(deltachat-desktop)$" }, workspace = "4 silent" })
	-- hl.window_rule({ name = "telegram", match = { class = "^(Telegram)$" }, workspace = "4 silent" })
	-- hl.window_rule({ name = "steam", match = { class = "^(steam)$" }, workspace = "3 silent" })
	-- hl.window_rule({ name = "tauon", match = { class = "^(tauon)$" }, workspace = "3 silent" })
	-- hl.window_rule({ name = "keepassxc", match = { class = "^(keepassxc)$" }, workspace = "1" })
	-- hl.window_rule({ name = "ferdium", match = { class = "^(ferdium)$" }, workspace = "5 silent" })
	-- hl.window_rule({ name = "thunderbird", match = { class = "^(thunderbird)$" }, workspace = "5 silent" })

	-- background services
	hl.exec_cmd("syncthing && nextcloud") -- file sync
	hl.exec_cmd("sleep 5 && uxplay") -- AirPlay server
	hl.exec_cmd("steam -silent && tauon")
	hl.exec_cmd("discord --start-minimized", { workspace = "5 silent" })

	-- apps
	-- hl.exec_cmd("thunderbird && ferdium")
	hl.exec_cmd("deltachat-desktop", { workspace = "4 silent" })
	hl.exec_cmd("sleep 3 && Telegram", { workspace = "4 silent" })
	hl.exec_cmd("keepassxc", { workspace = "1" })
end)
