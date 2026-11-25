-- ------------------------------------------------------------
-- MONITORS
-- ------------------------------------------------------------

local res = "UWQHD" -- options "UWQHD", "WQHD", "FHD"
local hdr_mode = "dcip3"

-- --- cm = color management preset
-- auto    - srgb for 8bpc, wide for 10bpc if supported (recommended)
-- srgb    - sRGB primaries (default)
-- dcip3   - DCI P3 primaries
-- dp3     - Apple P3 primaries
-- adobe   - Adobe RGB primaries
-- wide    - wide color gamut, BT2020 primaries
-- edid    - primaries from edid (known to be inaccurate)
-- hdr     - wide color gamut and HDR PQ transfer function (experimental)
-- hdredid - same as hdr with edid primaries (experimental)

-- --- separate config for the wide screen (ultra wide/wide)
if res == "FHD" then
	hl.monitor({
		output = "DP-2",
		mode = "1920x1080@120",
		position = "1080x165",
		scale = 1,
		cm = hdr_mode,
		bitdepth = 10,
		sdrbrightness = 1.0,
		sdrsaturation = 1.0,
	})
elseif res == "WQHD" then
	hl.monitor({
		output = "DP-2",
		mode = "2560x1440@59.97",
		position = "1080x165",
		scale = 1,
		cm = hdr_mode,
		bitdepth = 10,
		sdrbrightness = 1.0,
		sdrsaturation = 1.0,
	})
else
	hl.monitor({
		output = "DP-2",
		mode = "3440x1440@59.97",
		position = "1080x165",
		scale = 1,
		cm = hdr_mode,
		bitdepth = 10,
		sdrbrightness = 1.0,
		sdrsaturation = 1.0,
	})
end

hl.monitor({ output = "DP-3", mode = "1920x1080@60", position = "0x0", scale = 1, transform = 1 })

-- default config
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
