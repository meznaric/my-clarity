-- -- main module file
-- local module = require("plugin_name.module")
local lush = require("lush")
local utils = require("my-clarity.update-ts-queries")

---@class Config
---@field base_color string | number month name, day number or "by_day"
local internal_config = {
	-- Dynamic settings
	base_color = "by_day",
	accent_offset = 120,
	second_offset = -120,
	-- Fixed settings
}

---@class MyModule
local M = {}

---@type Config
M.internal_config = internal_config

local function update_from_config()
	package.loaded["lush_theme.my-clarity-2"] = nil
	lush(require("lush_theme.my-clarity-2")(M.internal_config))
end

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
	utils.update_highlights()
	M.internal_config = vim.tbl_deep_extend("force", M.internal_config, args or {})
	update_from_config()
end

M.change_color = function(color)
	M.internal_config.base_color = color
	update_from_config()
end

M.change_config = function(config)
	M.internal_config = vim.tbl_deep_extend("force", M.internal_config, config or {})
	update_from_config()
end

M.get_config = function()
	return M.internal_config
end

return M
