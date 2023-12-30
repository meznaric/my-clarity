-- -- main module file
-- local module = require("plugin_name.module")
local lush = require("lush")
local presets = require("my-clarity.presets")

--- @alias PresetName "default" | "analogous" | "complementary" | "triadic" | "new_year" | "summer" | "halloween" | "spring" | "autumn" | "winter" | "dynamic_analogous" | "dynamic_complementary"

---@class PresetConfig
---@field color_mode "preset"
---@field preset_name PresetName

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
---@field next_preset string

---@alias MyClarityConfigColors FixedConfig | ByDayConfig | DynamicConfig | PresetConfig

---@class MyClarityConfig
---@field colors? MyClarityConfigColors
---@field keymaps? false | true | KeymapsConfig
---@field disable_semantic_tokens? boolean
local internal_config = {
	colors = presets.default.colors,
	keymaps = false,
	disable_semantic_tokens = true,
}

---@class MyClarityCore
local M = {}

---@type MyClarityConfig
M.internal_config = internal_config

-- Applies the theme based on the config
local function apply_theme_from_config()
	package.loaded["lush_theme.my-clarity-2"] = nil
	lush(require("lush_theme.my-clarity-2")(M.internal_config))
end

local function apply_keymaps_from_config()
	local keymaps = M.internal_config.keymaps
	if M.internal_config.keymaps == true then
		keymaps = {
			next_day = "<leader>n",
			next_preset = "<leader>b",
			next_month = "<leader>m",
		}
	end

	if M.internal_config.keymaps ~= false and keymaps ~= nil then
		vim.api.nvim_set_keymap("", keymaps.next_preset, "", {
			silent = true,
			callback = M.next_preset,
		})
		vim.api.nvim_set_keymap("", keymaps.next_day, "", {
			silent = true,
			callback = M.next_day,
		})
		vim.api.nvim_set_keymap("", keymaps.next_month, "", {
			silent = true,
			callback = M.next_month,
		})
	end
end

---@param config MyClarityConfig?
M.change_config = function(config)
	-- Make sure preset is transformed into colors
	local with_applied_preset = config
	if config ~= nil and config.colors ~= nil and config.colors.color_mode == "preset" then
		with_applied_preset.colors = presets[config.colors.preset_name].colors
	end
	-- Merge into final config
	M.internal_config = vim.tbl_deep_extend("force", M.internal_config, with_applied_preset or {})

	-- Semantic tokens are disabled by default
	if M.internal_config.disable_semantic_tokens then
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client == nil then
					return
				end
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
	end

	-- Use all new configured values
	apply_keymaps_from_config()
	apply_theme_from_config()

	-- We need to toggle indent-blankline to make it work with the new theme
	if vim.fn.exists(":IBLDisable") > 0 then
		vim.cmd(":IBLDisable")
		vim.cmd(":IBLEnable")
	end
end

---@param args MyClarityConfig?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
	M.change_config(args or {})
end

local preset_index = 0
local total_presets = 0
for _ in pairs(presets) do
	total_presets = total_presets + 1
end

local current_day = os.date("*t").yday
M.next_day = function()
	current_day = (current_day + 2) % 365
	local colors = {
		color_mode = "by_day",
		day = current_day,
		first_offset = 120,
		second_offset = -60,
	}
	vim.notify("Day of the year: " .. current_day .. " " .. vim.inspect(colors))
	M.change_config({ colors = colors })
end

M.next_month = function()
	current_day = (current_day + 30) % 365
	local colors = {
		color_mode = "by_day",
		day = current_day,
		first_offset = 120,
		second_offset = -60,
	}
	vim.notify("Day of the year: " .. current_day .. " " .. vim.inspect(colors))
	M.change_config({ colors = colors })
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
			return
		end
		index = index + 1
	end
end

M.get_config = function()
	return M.internal_config
end

return M
