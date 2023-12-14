local presets = require("my-clarity.presets")

local M = {}
local internal_state = {
	current_preset = 0,
}

M.next_preset = function()
	internal_state.current_preset = internal_state.current_preset + 1
	if internal_state.current_preset > #presets then
		internal_state.current_preset = 1
	end
	return presets[internal_state.current_preset]
end

M.setup_keymaps = function() end

return M
