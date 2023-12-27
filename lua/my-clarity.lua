-- -- main module file
-- local module = require("plugin_name.module")
local lush = require("lush")
local utils = require("my-clarity.update-ts-queries")
local presets = require("my-clarity.presets")

---@class FixedConfig
---@field color_mode "fixed"
---@field base_hue number
---@field first_hue number
---@field second_hue number

---@class ByDayConfig
---@field color_mode "by_day"
---@field day number
---@field first_offset number
---@field second_offset number

---@class DynamicConfig
---@field color_mode "dynamic"
---@field first_offset number
---@field second_offset number

---@class KeymapsConfig
---@field next_day string
---@field next_month string
---@field next_mode string

---@class Config
---@field colors? FixedConfig | ByDayConfig | DynamicConfig
---@field keymaps? false | true | KeymapsConfig
local internal_config = {
	colors = presets.default.colors,
	keymaps = false,
}

---@class MyClarityCore
local M = {}

---@type Config
M.internal_config = internal_config

-- Applies the theme based on the config
local function apply_theme_from_config()
	package.loaded["lush_theme.my-clarity-2"] = nil
	lush(require("lush_theme.my-clarity-2")(M.internal_config))
end

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
	utils.update_highlights()
	M.internal_config = vim.tbl_deep_extend("force", M.internal_config, args or {})
	if M.internal_config.keymaps then
		vim.api.nvim_set_keymap("", "<leader>b", "", {
			silent = true,
			callback = M.next_preset,
		})
		vim.api.nvim_set_keymap("", "<leader>n", "", {
			silent = true,
			callback = M.next_day,
		})
	end
	apply_theme_from_config()
end

local preset_index = 0
local total_presets = 0
for _ in pairs(presets) do
	total_presets = total_presets + 1
end

local current_day = 1
M.next_day = function()
	current_day = (current_day + 7) % 365
	M.change_config({
		colors = {
			color_mode = "by_day",
			day = current_day,
			first_offset = 60,
			second_offset = -60,
		},
	})
	-- print("current_day: " .. current_day)
	vim.cmd(":IBLDisable")
	vim.cmd(":IBLEnable")
end

M.next_preset = function()
	preset_index = (preset_index + 1) % total_presets
	local index = 0

	for k, v in pairs(presets) do
		if index == preset_index then
			vim.notify("Setting preset: " .. k .. " " .. vim.inspect(v.colors))
			M.change_config({
				colors = v.colors,
			})
			vim.cmd(":IBLDisable")
			vim.cmd(":IBLEnable")
			return
		end
		index = index + 1
	end
end

---@param config Config?
M.change_config = function(config)
	M.internal_config = vim.tbl_deep_extend("force", M.internal_config, config or {})
	apply_theme_from_config()
end

M.get_config = function()
	return M.internal_config
end

return M
