local M = {}

local function lerp(x, y, t)
	return x + (y - x) * t
end

local function mapToRange(value, fromMin, fromMax, toMin, toMax)
	return toMin + (value - fromMin) * (toMax - toMin) / (fromMax - fromMin)
end

M.getCurrentHue = function(day_of_year)
	-- Define the hue values for each season
	local winterHue = 210
	local springHue = 120
	local summerHue = 55
	local autumnHue = 20

	-- Map dayOfTheYear to a value between 0 and 365
	local mappedValue = mapToRange(day_of_year % 365, 1, 365, 0, 1)

	-- Interpolate between the hues based on the mapped value
	local currentHue
	if mappedValue < 0.25 then
		currentHue = lerp(winterHue, springHue, mappedValue / 0.25)
	elseif mappedValue < 0.5 then
		currentHue = lerp(springHue, summerHue, (mappedValue - 0.25) / 0.25)
	elseif mappedValue < 0.75 then
		currentHue = lerp(summerHue, autumnHue, (mappedValue - 0.5) / 0.25)
	else
		currentHue = lerp(autumnHue, winterHue - 360, (mappedValue - 0.75) / 0.25)
	end

	return currentHue
end

return M
