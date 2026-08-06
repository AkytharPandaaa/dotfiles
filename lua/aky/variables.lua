-- ------------------------------------------------------------
-- ENVIRONMENTAL VARIABLES
-- ------------------------------------------------------------

-- design settings
hl.env("HYPRCURSOR_THEME", "Vimix-cursors")
hl.env("HYPRCURSOR_SIZE", "36")
hl.env("XCURSOR_THEME", "Vimix-cursors")
hl.env("XCURSOR_SIZE", "36")

-- Nvidia settings
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Qt/KDE settings
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("XDG_MENU_PREFIX", "arch-")

-- ssh-agent
hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/ssh-agent.socket")
