-- ------------------------------------------------------------
-- WINDOW RULES
-- ------------------------------------------------------------

-- TODO: change to window rule to always start scad with xwayland
local scad = "env QT_QPA_PLATFORM=xcb openscad"

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
	name = "global ignore maximize",
	match = { class = ".*" },

	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix dragging issues with XWayland",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Minecraft
hl.window_rule({
	name = "Minecraft Forge - Fullscreen",
	match = {
		initial_class = "^(Minecraft.+)$",
		initial_title = "^(FML early loading progress)$",
	},

	fullscreen = true,
	content = "game",
})

-- Steam
hl.window_rule({
	name = "Steam updater",
	match = {
		class = "^()$",
		title = "^(Steam)$",
	},

	float = true,
	no_initial_focus = true,
	move = { "(monitor_w*0.85-window_w*0.5)", "45" },
})
hl.window_rule({
	name = "Steam Games",
	match = {
		class = "^(steam_app_[0-9]*)$",
	},

	fullscreen = true,
	content = "game",
	content = game,
})
hl.window_rule({
	name = "Palworld Crash Reporter",
	match = {
		initial_class = "^(steam_app_1623730)$",
		initial_title = "^(Pal Crash Reporter)$",
	},

	float = true,
	fullscreen = false,
	size = { 800, 700 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})
hl.window_rule({
	name = "Wine Config",
	match = {
		class = "^(steam_proton)$",
		title = "^(Wine-Konfiguration)$",
	},

	float = true,
	size = { 420, 500 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})

-- screenshare
hl.window_rule({
	name = "select screenshare",
	match = {
		initial_class = "^(hyprland-share-picker)$",
		initial_title = "^([Ss]elect what to share)$",
	},

	float = true,
	pin = true,
	size = { 500, 500 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})

-- KDE (settings)
hl.window_rule({
	name = "Dolphin settings",
	match = {
		initial_class = "^(org.kde.dolphin)$",
		initial_title = "^(Einrichten . Dolphin)$",
	},

	float = true,
	size = { 1150, 650 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})
hl.window_rule({
	name = "ReImage dialogs",
	match = {
		initial_class = "^(org.kde.kdialog_progress_helper)$",
		initial_title = "^(.{2,})$",
	},

	float = true,
	size = { 600, 100 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})

-- Hytale
hl.window_rule({
	name = "Hytale Launcher",
	match = {
		class = "^(com.hypixel.HytaleLauncher)$",
		title = "^(Hytale Launcher)$",
	},

	float = true,
})
hl.window_rule({
	name = "Hytale Game",
	match = {
		class = "^(HytaleClient)$",
		title = "^(Hytale)$",
	},

	fullscreen = true,
	content = "game",
})

-- JDownloader windowrules
-- windowrule = float, initialClass:^(org-jdownloader-update-launcher-JDLauncher)$, title:^(win0)$  # forces link crawler window to float
-- windowrule = float, initialClass:^(org-jdownloader-update-launcher-JDLauncher)$, title:^(win3)$  # forces link right click menu to float
-- windowrule = float, initialClass:^(org-jdownloader-update-launcher-JDLauncher)$, title:^(win4)$  # forces link right click menu to float
-- windowrule = float, initialClass:^(org-jdownloader-update-launcher-JDLauncher)$, initialTitle:^(JDownloader-Updater)$  # forces the updater to float
-- windowrule = float, initialClass:^(org-jdownloader-update-launcher-JDLauncher)$, initialTitle:^(Eine neue Aktualisierung ist verfügbar)$  # forces the updater to float
-- windowrule = float, initialClass:^(org-jdownloader-update-launcher-JDLauncher)$, initialTitle:^(Bitte warten...)$  # forces the search for variants to float
-- windowrule = float, initialClass:^(org-jdownloader-update-launcher-JDLauncher)$, initialTitle:^(Wähle eine Variante für [0-9]+ [A-Za-z0-9 \(\)])$  # forces the selection of variants to float
hl.window_rule({
	name = "JDownloader Main Window",
	match = {
		initial_class = "^(org-jdownloader-update-launcher-JDLauncher)$",
		title = "^(JDownloader [0-9])$",
	},

	tile = true,
})

-- floating windows
hl.window_rule({
	name = "PiP windows",
	match = {
		title = "^([Bb]ild[- ]im[- ][Bb]ild|[Pp]icture[- ]in[- ][Pp]icture)$",
	},

	pin = true,
	float = true,
	size = { 853, 480 },
	persistent_size = true,
	no_initial_focus = true,
	move = { "(monitor_w-window_w-7)", "(monitor_h*0.03+45)" },
})
-- Media Players
hl.window_rule({
	name = "Fladder (Jellyfin Frontend)",
	match = {
		initial_class = "^(Fladder)$",
		initial_title = "^(Fladder)$",
	},

	fullscreen = false,
})
hl.window_rule({
	name = "MPV Player",
	match = {
		initial_class = "^(mpv)$",
	},

	float = true,
	size = { 853, 480 },
	move = { "(monitor_w-window_w)", 45 },
})

-- Thunar
hl.window_rule({
	name = "Thunar file transfer progress",
	match = {
		class = "^(thunar)$",
		title = "^(Dateivorgangsfortschritt)$",
	},

	float = true,
	size = { 550, 120 },
	move = { "(monitor_w*0.5-window_w*0.5)", "45" },
})
hl.window_rule({
	name = "Thunar file rename",
	match = {
		class = "^(thunar)$",
		title = "^(».+« umbenennen)$",
	},

	float = true,
})
hl.window_rule({
	name = "Thunar multi-rename",
	match = {
		class = "^(thunar)$",
		title = "^(Mehrere .+ umbenennen)$",
	},

	float = true,
	size = { 1800, 900 },
})

-- GTK Open/Save Dialogs
hl.window_rule({
	name = "GTK Speichern Dialog",
	match = {
		class = "^(xdg-desktop-portal-gtk)$",
		title = "^(Speichern unter.*)$",
	},

	float = true,
	size = { 1080, 700 },
	move = { "(cursor_x-(window_w*0.5))", "(monitor_h*0.3-(window_h*0.5))" },
})

-- Chatterino
hl.window_rule({
	name = "Chatterino2 Emotes",
	match = {
		class = "^(com.chatterino.chatterino)$",
		title = "^(Emotes in .+)$",
	},

	float = true,
	size = { 450, 400 },
	move = { "(cursor_x-(window_w*0.5))", "(cursor_y-(window_h*0.5))" },
})
hl.window_rule({
	name = "Chatterino2 Usercard",
	match = {
		class = "^(com.chatterino.chatterino)$",
		title = "^(.* Usercard - .*)$",
	},

	float = true,
	size = { 450, 400 },
	move = { "(cursor_x-(window_w*0.5))", "(cursor_y-(window_h*0.5))" },
})

-- Firefox
hl.window_rule({
	name = "Firefox delete Cookies",
	match = {
		class = "^(firefox)$",
		title = "^(Cookies und Website-Daten löschen)$",
	},

	float = true,
	size = { 500, 150 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})
hl.window_rule({
	name = "Firefox Downloads/Bookmarks",
	match = {
		class = "^(firefox)$",
		title = "^(Bibliothek)$",
	},

	float = true,
	size = { 650, 400 },
	move = { "(monitor_w*0.85-window_w*0.5)", "(monitor_h*0.1-window_h*0.15)" },
})
-- LibreOffice
hl.window_rule({
	name = "LibreOffice - Text importieren",
	match = {
		class = "^(soffice)$",
		title = "^([Tt]extimport)$",
	},

	float = true,
	size = { 1200, 850 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})

-- OnlyOffice
hl.window_rule({
	name = "OnlyOffice - open",
	match = {
		class = "^(DesktopEditors)$",
		title = "^([Dd]okument [Öö]ffnen)$",
	},

	float = true,
	size = { 850, 900 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})
hl.window_rule({
	name = "OnlyOffice - save",
	match = {
		class = "^(DesktopEditors)$",
		title = "^()$",
	},

	float = true,
	size = { 450, 125 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})
hl.window_rule({
	name = "OnlyOffice - save as",
	match = {
		class = "^(DesktopEditors)$",
		title = "^([Ss]peichern [Uu]nter)$",
	},

	float = true,
	size = { 800, 500 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})
hl.window_rule({
	name = "OnlyOffice - print",
	match = {
		class = "^(DesktopEditors)$",
		title = "^([Dd]okument [Dd]rucken)$",
	},

	float = true,
	size = { 800, 500 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})

-- KiCad
hl.window_rule({
	name = "KiCad - rename Footprint",
	match = {
		class = "^(kicad)$",
		title = "^(Footprint-Auswahl.+)$",
	},

	size = { 1000, 700 },
})

-- Wine
hl.window_rule({
	name = "Wine",
	match = {
		class = "^(wineboot.exe)$",
		title = "^(Wine)$",
	},

	float = true,
})

-- Blueman Manager
hl.window_rule({
	name = "Blueman Manager",
	match = {
		class = "^(blueman-manager)$",
		title = "^(Bluetooth-Geräte)$",
	},

	pin = true,
	float = true,
	size = { 540, 360 },
	move = { "(monitor_w*0.9-window_w*0.5)", "45" },
})

hl.window_rule({
	name = "Discord Popout",
	match = {
		initial_title = "^(Discord Popout)$",
	},

	pin = true,
	float = true,
	no_initial_focus = true,
	size = { 500, 1170 },
	move = { 0, "(monitor_h * 0.5 - window_h * 0.5)" },
})

hl.window_rule({
	name = "GIMP - export window",
	match = {
		initial_class = "^(file-(jpeg|png))$",
	},

	float = true,
	size = { 920, 590 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})

hl.window_rule({
	name = "Nextcloud Client dropdown",
	match = {
		initial_class = "^(com.nextcloud.desktopclient.nextcloud)$",
		initial_title = "^(Nextcloud)$",
	},

	pin = true,
	float = true,
	size = { 500, 800 },
	move = { "(monitor_w*0.9-window_w*0.5)", "45" },
})

hl.window_rule({
	name = "KeePassXC - Browser Permissions",
	match = {
		initial_class = "^(org.keepassxc.KeePassXC)$",
		initial_title = "^(.* - Browser-Zugriffsanfrage)$",
	},

	float = true,
	size = { 640, 200 },
	move = { "(monitor_w*0.5-window_w*0.5)", "(monitor_h*0.5-window_h*0.5)" },
})
