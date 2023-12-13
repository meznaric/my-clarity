local M = {}
-- Ripped from some github issue
local function safe_read(filename, read_quantifier)
	local file, err = io.open(filename, "r")
	if not file then
		error(err)
	end
	local content = file:read(read_quantifier)
	io.close(file)
	return content
end

local function read_query_files(filenames)
	local contents = {}

	for _, filename in ipairs(filenames) do
		table.insert(contents, safe_read(filename, "*a"))
	end

	return table.concat(contents, "")
end

local function remove_highlight_group(group, query)
	-- Escape special characters in the group string
	local escapedGroup = group:gsub("[%-%.%+%[%]%(%)%$%^%%%?%*]", "%%%1")

	-- Define the start and end patterns for the range to be removed
	local startPattern = "%(%(identifier%) " .. escapedGroup
	local endPattern = "\n\n" -- Matches an empty line

	-- Find the start and end indices of the range to be removed
	local startIndex = string.find(query, startPattern)
	local endIndex = string.find(query, endPattern, startIndex) or #query
	-- If both start and end indices are found, remove the range
	if startIndex and endIndex then
		local prefix = string.sub(query, 1, startIndex - 1)
		local suffix = string.sub(query, endIndex + 1)
		query = prefix .. suffix
	end

	return query
end

-- This will override the query entirely
-- local function set_query(language, content)
-- 	vim.treesitter.query.set(language, "highlights", content)
-- end

-- This will read the existing query for the language and append to it
local function extend_query(language, content)
	local updated_query = (read_query_files(vim.treesitter.query.get_files(language, "highlights")) .. content)
	updated_query = remove_highlight_group("@type.builtin", updated_query)
	-- This fixes `Sentry.init(...)` where Sentry is highlighted as a type instead of a variable
	updated_query = remove_highlight_group("@type", updated_query)
	vim.treesitter.query.set(language, "highlights", updated_query)
end
-- this is a list of control keywords that get control flow highlights.
-- First line describes the orignal group they belong to

-- ; @conditional
-- "if"
-- "else"
-- "switch"
-- "case"

-- ; @keyword.return
-- "return"
-- "yield"

-- ; @exception
-- "throw"
-- "try"
-- "catch"
-- "finally"

-- ; @repeat (+ of)
-- "for"
-- "while"
-- "do"
-- "continue"

-- ; @keyword (+ 10 other)
-- "break"
-- "debugger"
-- "with"

-- ; @keyword.coroutine (+ async)
-- "await"

-- ; @keyword.operator (+ 4 other)
-- "new"
local control_flow_query = [[
[
"if"
"else"
"switch"
"case"
"return"
"yield"
"throw"
"try"
"catch"
"finally"
"for"
"while"
"do"
"continue"
"break"
"debugger"
"with"
"await"
"new"
] @tskeywordcontrolflow
]]

-- Scenario this fixes:
-- For example: `Sentry.init(...)` Sentry will be highlighted as type, but it's actually just a variable that we use in this case
local re_prioritise_query = [[
; ((identifier) @variable (#set! "priority" 105))
]]

-- Sets control flow keywords to @tskeywordcontrolflow highlight group
M.update_highlights = function()
	-- TODO: Remove ((identifier) @type from ecmascript
	extend_query("tsx", control_flow_query .. re_prioritise_query)
	extend_query("typescript", control_flow_query .. re_prioritise_query)
end

return M
