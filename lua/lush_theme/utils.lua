local lush = require("lush")
local hslUtils = require("lush.vivid.hsluv.lib")
local hsl = lush.hsluv

local M = {}

local function mapToRange(value, fromMin, fromMax, toMin, toMax)
	return toMin + (value - fromMin) * (toMax - toMin) / (fromMax - fromMin)
end

local winterHue = 235
local springHue = 120
local summerHue = 60
local autumnHue = 20

local function mix(c1, c2, t)
	local color1 = hsl(c1, 50, 50)
	local color2 = hsl(c2, 50, 50)
	local color1Lch = (hslUtils.hsluv_to_lch({ color1.h, color1.s, color1.l }))
	local color2Lch = (hslUtils.hsluv_to_lch({ color2.h, color2.s, color2.l }))
	local l = color1Lch[1] + t * (color2Lch[1] - color1Lch[1])
	local c = color1Lch[2] + t * (color2Lch[2] - color1Lch[2])
	local h = color1Lch[3] + t * (color2Lch[3] - color1Lch[3])

	-- Return the interpolated color as a new tuple

	local hue = hslUtils.lch_to_hsluv({ l, c, h })[1]
	-- vim.notify("l: " .. l .. " c: " .. c .. " h: " .. h .. " FINAL: " .. hue)
	return hue
end

-- Mid season % values:
-- 21, 47, 72, 97
-- Returns the hue based on the season we are in
-- It smoothly interpolates between throughout the year
M.getCurrentHue = function(day_of_year)
	-- Define the hue values for each season

	-- Map dayOfTheYear to a value between 0 and 365 to 0 to 100
	local mappedValue = mapToRange(day_of_year % 365, 1, 365, 0, 1)

	--   return mix(winterHue, springHue, 0.5)

	-- Interpolate between the hues based on the mapped value
	-- Mixing colors: hsl(winterHue, 50, 50).mix(hsl(springHue, 50, 50), mappedValue / 21).h
	local currentHue

	if mappedValue < 0.25 then
		currentHue = mix(winterHue, springHue, mappedValue / 0.25)
	elseif mappedValue < 0.5 then
		currentHue = mix(springHue, summerHue, (mappedValue - 0.25) / 0.25)
	elseif mappedValue < 0.75 then
		currentHue = mix(summerHue, autumnHue, (mappedValue - 0.5) / 0.25)
	else
		currentHue = mix(autumnHue, winterHue - 360, (mappedValue - 0.75) / 0.25)
	end
	return currentHue
end

return M
