-- ------------------------------------------------------------
-- ENVIRONMENTAL VARIABLES
-- ------------------------------------------------------------

-- design settings
hl.env("HYPRCURSOR_THEME", "Vimix-cursors")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Vimix-cursors")
hl.env("XCURSOR_SIZE", "24")

-- Qt/KDE settings
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("XDG_MENU_PREFIX", "arch-")

-- ssh-agent
hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/ssh-agent.socket")
