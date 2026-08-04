-- --- separate config for the wide screen ---
-- hl.monitor({ output = "DP-2", mode = "3440x1440@59.97", position = "1080x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "2560x1440@59.97", position = "1080x0", scale = 1 })

hl.monitor({ output = "DP-3", mode = "1920x1080@60", position = "0x0", scale = 1, transform = 1 })

-- default config
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
