-- ------------------------------------------------------------
-- MONITORS
-- ------------------------------------------------------------

-- separate config for the res on the main screen
hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "0x0", scale = 1.25 })
hl.monitor({ output = "eDP-1", mode = "1280x720@60", position = "0x0", scale = 1 })

-- default config
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
