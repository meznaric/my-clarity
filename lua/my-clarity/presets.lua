---@class PresetListConfig
---@field name string
---@field colors MyClarityConfigColors

---@type table<PresetName, PresetListConfig>
local presets = {
	default = {
		name = "default",
		colors = {
			color_mode = "dynamic",
			first_offset = 120,
			second_offset = -60,
		},
	},
	-- Fixed examples
	analogous = {
		name = "analogous",
		colors = {
			color_mode = "fixed",
			base_hue = 180,
			first_hue = 180 + 60,
			second_hue = 180 - 60,
		},
	},
	complementary = {
		name = "complementary",
		colors = {
			color_mode = "fixed",
			base_hue = 180,
			first_hue = 0,
			second_hue = 0,
		},
	},
	triadic = {
		name = "triadic",
		colors = {
			color_mode = "fixed",
			base_hue = 180,
			first_hue = 180 - 120,
			second_hue = 180 + 120,
		},
	},
	-- By day
	new_year = {
		name = "new_year",
		colors = {
			color_mode = "by_day",
			day = 1,
			first_offset = -60,
			second_offset = 60,
		},
	},
	summer = {
		name = "summer",
		colors = {
			color_mode = "by_day",
			day = 182,
			first_offset = -60,
			second_offset = 60,
		},
	},
	halloween = {
		name = "halloween",
		colors = {
			color_mode = "by_day",
			day = 304,
			first_offset = -60,
			second_offset = 60,
		},
	},
	spring = {
		name = "spring",
		colors = {
			color_mode = "by_day",
			day = 118,
			first_offset = -60,
			second_offset = 60,
		},
	},
	autumn = {
		name = "autumn",
		colors = {
			color_mode = "by_day",
			day = 332,
			first_offset = -60,
			second_offset = 60,
		},
	},
	winter = {
		name = "winter",
		colors = {
			color_mode = "by_day",
			day = 31,
			first_offset = -60,
			second_offset = 60,
		},
	},
	-- Dynamic
	dynamic_analogous = {
		name = "dynamic_analogous",
		colors = {
			color_mode = "dynamic",
			first_offset = -60,
			second_offset = 60,
		},
	},
	dynamic_complementary = {
		name = "dynamic_complementary",
		colors = {
			color_mode = "dynamic",
			first_offset = -120,
			second_offset = 120,
		},
	},
}

return presets
