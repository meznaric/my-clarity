--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	-- local darkPrimary  = hsl(226, 47, 3)
	local darkPrimary = hsl(226, 47, 3)
	local lightPrimary = hsl(214, 12, 95)
	-- local darkPrimary  = hsl(90, 47, 3)
	-- local lightPrimary  = hsl(214, 12, 95)

	local accent3 = hsl(178, 50, 65)
	local accent1 = hsl(08, 46, 55)
	local accent2 = hsl(208, 62, 65)
	local success = hsl(150, 80, 45)
	local error = hsl(0, 70, 50)

	local i1 = { bg = darkPrimary, fg = accent1, gui = "bold" }
	local i3 = { bg = darkPrimary, fg = lightPrimary.darken(15) }
	local i2 = { bg = darkPrimary, fg = lightPrimary.darken(40).saturate(10) }
	local i4 = { bg = darkPrimary, fg = lightPrimary.saturate(50).darken(55) }

	return {
		sym("@class")({ fg = hsl(0, 0, 0), bg = hsl(0, 50, 90) }),
		-- The following are all the Neovim default highlight groups from the docs
		-- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
		-- probably style all of these at a bare minimum.
		--
		-- not the order you will end up with.
		--
		-- You can uncomment these and leave them empty to disable any
		-- styling for that group (meaning they mostly get styled as Normal)
		-- or leave them commented to apply vims default colouring or linking.

		ColorColumn({ bg = darkPrimary.lighten(1) }), -- used for the columns set with 'colorcolumn'
		-- Todo different setting for indent line (same thing is used for unused variables)
		Conceal({ bg = Normal.bg, fg = darkPrimary.lighten(12) }), -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ bg = darkPrimary.darken(10), fg = Comment.fg }), -- character under the cursor
		Comment({ bg = darkPrimary.lighten(3), fg = darkPrimary.lighten(40) }), -- any comment
		lCursor({ bg = darkPrimary, fg = lightPrimary }), -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({ bg = darkPrimary, fg = lightPrimary }), -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn({ bg = darkPrimary, fg = lightPrimary }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({ bg = darkPrimary, fg = lightPrimary }), -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ bg = darkPrimary, fg = lightPrimary }), -- directory names (and other special names in listings)
		DiffAdd({ bg = darkPrimary.lighten(5), fg = success, gui = "bold" }), -- diff mode: Added line |diff.txt|
		DiffChange({ bg = darkPrimary.lighten(5), fg = accent3, gui = "bold" }), -- diff mode: Changed line |diff.txt|
		DiffDelete({ bg = darkPrimary.lighten(5), fg = error, gui = "bold" }), -- diff mode: Deleted line |diff.txt|
		DiffText({ bg = darkPrimary.lighten(5).lighten(10), fg = accent3 }), -- diff mode: Changed text within a changed line |diff.txt|
		KeyHighlight({ bg = accent1.darken(80).desaturate(30), fg = accent1 }),
		-- EndOfBuffer  { bg = darkPrimary, fg = lightPrimary }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor   { bg = darkPrimary, fg = lightPrimary }, -- cursor in a focused terminal
		-- TermCursorNC { bg = darkPrimary, fg = lightPrimary }, -- cursor in an unfocused terminal
		ErrorMsg({ bg = darkPrimary, fg = error }), -- error messages on the command line
		VertSplit({ bg = darkPrimary, fg = lightPrimary }), -- the column separating vertically split windows
		Folded({ DiffAdd }), -- line used for closed folds
		FoldColumn({ bg = darkPrimary.lighten(10), fg = darkPrimary.lighten(40) }), -- 'foldcolumn'
		WinSeparator({ bg = darkPrimary.lighten(10), fg = darkPrimary.lighten(40) }),
		FloatBorder({ bg = darkPrimary, fg = darkPrimary.lighten(50) }),
		SignColumn({ bg = darkPrimary.lighten(5), fg = lightPrimary }), -- column where |signs| are displayed
		-- Substitute   { bg = darkPrimary, fg = lightPrimary }, -- |:substitute| replacement text highlighting
		LineNr({ bg = darkPrimary, fg = accent1.darken(50) }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr({ bg = darkPrimary, fg = accent1 }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen({ bg = accent1, fg = lightPrimary }), -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg      { bg = darkPrimary, fg = lightPrimary }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { bg = darkPrimary, fg = lightPrimary }, -- Area for messages and cmdline
		-- MsgSeparator { bg = darkPrimary, fg = lightPrimary }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg      { bg = darkPrimary, fg = lightPrimary }, -- |more-prompt|
		NonText({ bg = SignColumn.bg, fg = lightPrimary }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		-- IndentLineHL { bg = 'red' },
		Normal({ bg = darkPrimary, fg = lightPrimary }), -- normal text
		NormalFloat({ bg = darkPrimary, fg = lightPrimary.darken(40) }), -- Normal text in floating windows.
		-- NormalNC     { }, -- normal text in non-current windows
		Pmenu({}), -- Popup menu: normal item.
		PmenuSel({ bg = darkPrimary.lighten(10), fg = i3.fg }), -- Popup menu: selected item.
		-- PmenuSbar    { }, -- Popup menu: scrollbar.
		-- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
		BufTabLine({ bg = darkPrimary.darken(10) }),
		BufTabLineFill({ bg = darkPrimary.darken(10) }),
		BufTabLineActive({ bg = accent1.darken(50), fg = Normal.fg }),
		BufTabLineHidden({ bg = darkPrimary.lighten(10) }),
		BufTabLineCurrent({ bg = accent1 }),
		Question({ fg = success }), -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		IncSearch({ bg = accent3, fg = darkPrimary }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Search({ bg = accent2, fg = darkPrimary }), -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		-- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine({ bg = darkPrimary.lighten(10), fg = i2.fg }), -- status line of current window
		StatusLineInverse({ bg = i2.fg, fg = darkPrimary.lighten(10) }), -- status line of current window
		StatusLineHighlight({ bg = darkPrimary.lighten(10), fg = i3.fg }), -- status line of current window
		WinBar({ bg = darkPrimary.lighten(10), fg = i3.fg }),
		WinBarNC({ bg = darkPrimary.lighten(10), fg = i3.fg }),
		StatusLineNC({}), -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine({}), -- tab pages line, not active tab page label
		TabLineFill({}), -- tab pages line, where there are no labels
		Title({}), -- titles for output from ":set all", ":autocmd" etc.
		TabLineSel({}), -- tab pages line, active tab page label
		Visual({ bg = darkPrimary.lighten(10), fg = "white" }), -- Visual mode selection
		VisualNOS({ Visual }), -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = hsl(69, 45, 45) }), -- warning messages
		Whitespace({}), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		ExtraWhitespace({ bg = lightPrimary.darken(40), fg = darkPrimary }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu({}), -- current match in 'wildmenu' completion

		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Constant({ bg = darkPrimary, fg = lightPrimary.rotate(60) }), -- (preferred) any constant
		String({ bg = darkPrimary, fg = accent3 }), --   a string constant: "this is a string"
		Character({ String }), --  a character constant: 'c', '\n'
		Number({ String }), --   a number constant: 234, 0xff
		Boolean({ Constant }), --  a boolean constant: TRUE, false
		Float({ String }), --    a floating point constant: 2.3e10

		Identifier({ Constant, fg = accent2 }), -- (preferred) any variable name
		-- Function       { }, -- function name (also: methods for classes)

		Statement({ fg = Constant.fg.darken(40) }), -- (preferred) any statement
		Conditional({ Statement }), --  if, then, else, endif, switch, etc.
		Repeat({ Statement }), --   for, do, while, etc.
		Label({ Statement }), --    case, default, etc.
		Operator({ Statement }), -- "sizeof", "+", "*", etc.
		Keyword({ Statement }), --  any other keyword
		Exception({ Statement }), --  try, catch, throw

		PreProc({ Constant }), -- (preferred) generic Preprocessor
		Include({ Constant }), --  preprocessor #include
		Define({ Constant }), --   preprocessor #define
		Macro({ Constant }), --    same as Define
		PreCondit({ Constant }), --  preprocessor #if, #else, #endif, etc.

		Type({ fg = accent1 }), -- (preferred) int, long, char, etc.
		StorageClass({ fg = accent1 }), -- static, register, volatile, etc.
		Structure({ fg = accent1 }), --  struct, union, enum, etc.
		Typedef({ fg = accent1 }), --  A typedef

		Special({ Constant, fg = accent3 }), -- (preferred) any special symbol
		SpecialChar({ Constant, fg = lightPrimary.darken(50) }), --  special character in a constant
		Tag({ SpecialChar }), --    you can use CTRL-] on this
		Delimiter({ SpecialChar }), --  character that needs attention
		SpecialComment({ SpecialChar }), -- special things inside a comment
		Debug({ SpecialChar }), --    debugging statements

		Underlined({ gui = "underline" }), -- (preferred) text that stands out, HTML links
		Bold({ gui = "bold" }),
		Italic({ gui = "italic" }),

		-- ("Ignore", below, may be invisible...)
		-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

		-- Error          { }, -- (preferred) any erroneous construct

		Todo({ bg = accent1.lighten(10), fg = "black" }), -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.

		-- LspReferenceText                     { }, -- used for highlighting "text" references
		-- LspReferenceRead                     { }, -- used for highlighting "read" references
		-- LspReferenceWrite                    { }, -- used for highlighting "write" references

		-- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		-- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		-- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		-- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

		-- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
		-- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
		-- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
		-- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

		-- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
		-- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
		-- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
		-- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

		-- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
		-- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
		-- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
		-- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

		-- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
		-- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
		-- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
		-- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

		-- LspCodeLens                          { }, -- Used to color the virtual text of the codelens

		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.

		helpBacktick({ bg = i2.bg, fg = accent1 }),
		helpCommand({ bg = i2.bg, fg = accent1 }),
		helpExample({ bg = i2.bg, fg = accent1.desaturate(50).lighten(10) }),
		helpOption({ bg = i2.bg, fg = accent1 }),
		Undefined({ bg = "purple", fg = "black" }),
		Ip1({ bg = i1.bg, fg = i1.fg }), -- For control flow
		Ip15({ bg = i1.bg, fg = i1.fg.desaturate(40).lighten(10) }), -- For control flow
		Ip2({ bg = i2.bg, fg = i2.fg }), -- For
		Ip3({ bg = i3.bg, fg = i3.fg }), -- For
		Ip4({ bg = i4.bg, fg = i4.fg }), -- For
		Ip5({ bg = i4.bg, fg = i4.fg.lighten(30).saturate(50) }), -- For
		Ip6({ bg = i4.bg, fg = i4.fg.darken(10).desaturate(50) }), -- For
		Active({ bg = "red", fg = "black" }),
		SpecialKey({ bg = darkPrimary, fg = accent2 }), -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		TSAnnotation({ Undefined }), -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		TSAttribute({ Undefined }), -- (unstable) TODO: docs
		TSBoolean({ Ip2 }), -- For booleans.
		TSCharacter({ Undefined }), -- For characters.
		TSComment({ Comment }), -- For comment blocks.
		TSConstructor({ Ip3 }), -- For
		TSConditional({ Ip1 }), -- For keywords related to conditionnals.
		TSConstant({ Ip2 }), -- For constants
		TSConstBuiltin({ Ip2 }), -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro({ Ip3 }), -- For constants that are defined by macros: `NULL` in C.
		TSError({ ErrorMsg }), -- For syntax/parser errors.
		TSException({ Ip1 }), -- Try/catch
		TSField({ Ip3 }), -- For fields.
		TSFloat({ Ip2 }), -- For floats.
		TSFunction({ Ip3 }), -- For function (calls and definitions).
		TSFuncBuiltin({ Ip3 }), -- For builtin functions: `table.insert` in Lua.
		TSFuncMacro({ Ip3 }), -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude({ Ip4 }), -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword({ Ip2 }), -- For keywords that don't fall in previous categories.
		TSKeywordFunction({ Ip4 }), -- For keywords used to define a fuction.
		TSLabel({ Ip3 }), -- For labels: `label:` in C and `:label:` in Lua.
		TSMethod({ Ip3 }), -- For method calls and definitions.
		TSNamespace({ Ip3 }), -- For identifiers referring to modules and namespaces.
		-- TSNone               { Ip3 },    -- TODO: docs
		TSNumber({ Ip2 }), -- For all numbers
		TSOperator({ Ip2 }), -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter({ Ip3 }), -- For parameters of a function.
		TSParameterReference({ Ip3 }), -- For references to parameters of a function.
		TSProperty({ Ip3 }), -- Same as `TSField`.
		TSPunctDelimiter({ Ip4 }), -- For delimiters ie: `.`
		TSPunctBracket({ Ip4 }), -- For brackets and parens.
		TSPunctSpecial({ Ip4 }), -- For special punctutation that does not fall in the catagories before.
		TSRepeat({ Ip4 }), -- For keywords related to loops.
		TSString({ Ip2 }), -- For strings.
		TSStringRegex({ Ip2 }), -- For regexes.
		TSStringEscape({ Ip1 }), -- For escape characters within a string.
		TSType({ Ip5 }), -- For types.
		TSTypeBuiltin({ Ip5 }), -- For builtin types.
		TSVariable({ Ip3 }), -- Any variable name that does not have another highlight.
		TSVariableBuiltin({ Ip3 }), -- Variable names that are defined by the languages, like `this` or `self`.

		TSTag({ Ip3 }), -- Tags like html tag names.
		TSTagDelimiter({ Ip3 }), -- Tag delimiter like `<` `>` `/`
		TSText({ Ip6 }), -- For strings considered text in a markup language.
		TSEmphasis({ Undefined }), -- For text to be represented with emphasis.
		TSUnderline({ Undefined }), -- For text to be represented with an underline.
		TSStrike({ Undefined }), -- For strikethrough text.
		TSTitle({ Ip5 }), -- Text that is part of a title.
		TSSymbol({ Ip2 }), -- For identifiers referring to symbols or atoms.
		TSKeywordReturn({ Undefined }), -- For keywords that don't fall in previous categories.
		TSKeywordReturnStatement({ Undefined }), -- For keywords that don't fall in previous categories.
		TSLiteral({ Ip3 }), -- Literal text.
		TSURI({ Ip3 }), -- Any URI like a link or email.

		-- local accent1 = hsl(08, 46, 55);
		-- local darkPrimary  = hsl(226, 47, 3)
		CursorP0({ fg = Ip1.fg }),
		CursorP1({ fg = hsl(16, 46, 30) }),
		CursorP2({ fg = hsl(16, 46, 30) }),
		CursorP3({ fg = hsl(24, 46, 25) }),
		CursorP4({ fg = hsl(28, 46, 20) }),
		CursorP5({ fg = hsl(36, 46, 15) }),
		CursorP6({ fg = hsl(40, 46, 15) }),
		CursorP7({ fg = hsl(44, 47, 15) }),

		-- Custom non standard stuff
		TSKeywordControlFlow({ Ip1 }),
		KeywordControlFlow({ Ip1 }),
		-- nvim-cmp
		-- " gray
		CmpItemAbbrDeprecated({ Ip6, gui = "italic" }), -- guibg=NONE gui=strikethrough guifg=#808080
		-- " blue
		CmpItemAbbrMatch({ Ip1, gui = "bold" }), -- guibg=NONE guifg=#569CD6
		CmpItemAbbrMatchFuzzy({ Ip1 }), -- guibg=NONE guifg=#569CD6
		-- " light blue
		CmpItemKindVariable({ Ip3 }), -- guibg=NONE guifg=#9CDCFE
		CmpItemKindInterface({ Ip3 }), -- guibg=NONE guifg=#9CDCFE
		CmpItemClass({ Ip3 }),
		CmpItemKindFunction({ Ip3 }), -- guibg=NONE guifg=#C586C0
		CmpItemKindMethod({ Ip3 }), -- guibg=NONE guifg=#C586C0
		CmpItemKindKeyword({ Ip3 }), -- guibg=NONE guifg=#D4D4D4
		CmpItemKindProperty({ Ip3 }), -- guibg=NONE guifg=#D4D4D4
		CmpItemKindUnit({ Ip3 }), -- guibg=NONE guifg=#D4D4D4
		CmpItemKindText({ Ip6 }), -- guibg=NONE guifg=#9CDCFE
		CmpItemKind({ Ip3 }), -- guibg=NONE guifg=#D4D4D4
		CmpItemMenu({ Ip4 }),
		-- Coc
		CocErrorVirtualText({ ErrorMsg }),
		CocErrorHighlight({ ErrorMsg }),
		CocInfoVirtualText({ WarningMsg }),
		CocWarningHighlight({ WarningMsg }),
		CocWarningVirtualText({ WarningMsg }),
		CocUnusedHighlight({ WarningMsg }),
		CocInfoVirtualText({ Undefined }),
		CocInfoVirtualText({ Undefined }),
		CocFadeOut({ bg = darkPrimary, fg = accent1 }),
		IblIndent({ fg = accent1 }),
		IblScope({ fg = accent2 }),
		IblWhitespace({ fg = accent2 }),
		-- Pacakge-info
		PackageInfoOutdatedVersion({ bg = darkPrimary, fg = accent1 }),
		PackageInfoUpToDateVersion({ bg = darkPrimary, fg = accent2 }),
	}
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
