-- vim: set foldmethod=marker
local lush = require("lush")
local utils = require("lush_theme.utils")
local hsl = lush.hsluv

local dayOfTheYear = os.date("*t").yday

local function get_colors(colors)
	if colors.color_mode == "fixed" then
		return colors.base_hue, colors.first_hue, colors.second_hue
	elseif colors.color_mode == "by_day" then
		local currentHue = utils.getCurrentHue(colors.day)
		local accentHue = currentHue + colors.first_offset
		local commentHue = currentHue + colors.second_offset
		return currentHue, accentHue, commentHue
	elseif colors.color_mode == "dynamic" then
		local currentHue = utils.getCurrentHue(dayOfTheYear)
		local accentHue = currentHue + colors.first_offset
		local commentHue = currentHue + colors.second_offset
		return currentHue, accentHue, commentHue
	end
end

local themeFunc = function(config)
	local currentHue, accentHue, commentHue = get_colors(config.colors)

	return lush(function(injected_functions)
		local success = hsl(150, 99, 35)
		local remove = hsl(0, 90, 25)
		local error = hsl(360, 85, 60)
		local errorFg = hsl(365, 99, 50)
		local warn = hsl(50, 60, 49)
		local warnFg = hsl(50, 99, 60)
		local background = hsl(currentHue, 80, 3)

		local sym = injected_functions.sym
		local p1 = { fg = hsl(currentHue, 99, 95), gui = "bold" }
		local p2 = { fg = hsl(currentHue, 99, 75) }
		local p3 = { fg = hsl(currentHue, 80, 60) }
		local p4 = { fg = hsl(currentHue, 75, 55) }
		local p5 = { fg = hsl(currentHue, 70, 50) }
		local p6 = { fg = hsl(currentHue, 65, 45) }

		local a1 = { fg = hsl(accentHue, 50, 40), gui = "bold" }
		local a2 = { fg = hsl(accentHue, 60, 36) }
		local a3 = { fg = hsl(accentHue, 50, 32) }
		local a4 = { fg = hsl(accentHue, 40, 28) }
		local a5 = { fg = hsl(accentHue, 60, 24) }
		local a6 = { fg = hsl(accentHue, 80, 20) }

		local n1 = { fg = hsl(currentHue, 15, 98), gui = "bold" }
		local n2 = { fg = hsl(currentHue, 15, 80) }
		local n3 = { fg = hsl(currentHue, 15, 60) }
		local n4 = { fg = hsl(currentHue, 15, 40) }
		local n5 = { fg = hsl(currentHue, 15, 20) }
		local n6 = { fg = hsl(currentHue, 15, 0) }

		local c1 = { fg = hsl(commentHue, 50, 80) }
		local c2 = { fg = hsl(commentHue, 50, 70) }
		local c3 = { fg = hsl(commentHue, 50, 60) }
		local c4 = { fg = hsl(commentHue, 50, 50) }
		local c5 = { fg = hsl(commentHue, 50, 30) }
		local c6 = { fg = hsl(commentHue, 50, 13) }
	-- vim.treesitter.query.set_query("lua", "highlights", "")

  -- {{{ Style Return
	-- stylua: ignore start
	return {
    -- Control Flow
    P1 { fg = p1.fg, gui = p1.gui },
    P2 { fg = p2.fg, gui = p2.gui },
    P3 { fg = p3.fg, gui = p3.gui },
    P4 { fg = p4.fg, gui = p4.gui },
    P5 { fg = p5.fg, gui = p5.gui },
    P6 { fg = p6.fg, gui = p6.gui },
    -- Interface & meta code (types, decorators, etc.)
    A1 { fg = a1.fg, gui = a1.gui },
    A2 { fg = a2.fg, gui = a2.gui },
    A3 { fg = a3.fg, gui = a3.gui },
    A4 { fg = a4.fg, gui = a4.gui },
    A5 { fg = a5.fg, gui = a5.gui },
    A6 { fg = a6.fg, gui = a6.gui },
    -- Comments
    C1 { fg = c1.fg, gui = c1.gui },
    C2 { fg = c2.fg, gui = c2.gui },
    C3 { fg = c3.fg, gui = c3.gui },
    C4 { fg = c4.fg, gui = c4.gui },
    C5 { fg = c5.fg, gui = c5.gui },
    C6 { fg = c6.fg, gui = c6.gui },
    -- Interface (neutral colors)
    N1 { fg = n1.fg, gui = n1.gui },
    N2 { fg = n2.fg, gui = n2.gui },
    N3 { fg = n3.fg, gui = n3.gui },
    N4 { fg = n4.fg, gui = n4.gui },
    N5 { fg = n5.fg, gui = n5.gui },
    N6 { fg = n6.fg, gui = n6.gui },


    -- CurrentHue { fg = x },
    -- CurrentAccent { fg = y },
		--
		-- Preset
		-- TabBorder { fg = n1.fg }, -- tab.border, border to separate tabs from each other
		-- FloatBorder { fg = n1.fg },
		-- SelectionHighlightBackground { bg = a6.fg },
		--LightBulb { fg = '#ffcc00' },
		--CodeLens { fg = '#999999' },

    -- SignifyLineAdd { fg = success },
    -- SignifyLineChange { fg = warn },
    -- SignifyLineDelete { fg = error },
    SignifySignAdd { fg = success },
    SignifySignChange { fg = warnFg },
    SignifySignDelete { fg = error },

		-- GutterGitAdded { fg = '#487e02' },
		--GutterGitDeleted { fg = '#f14c4c' },
		--GutterGitModified { fg = '#1b81a8' },
		--Breadcrumb { fg = '#a9a9a9', bg = norm_bg },
		-- ScrollbarSlider { fg = p1.fg },
		--PeekViewBorder { fg = '#3794ff' },
		--PeekViewNormal { bg = '#001f33' },
		--PeekViewTitle { fg = white }, -- peekViewTitleLabel.foreground
		--PeekViewCursorLine { bg = '#002f4e' },
		--PeekViewMatchHighlight { bg ='#996214' }, -- peekViewEditor.matchHighlightBackground
		--GhostText { fg = '#6b6b6b' },
		--Icon { fg = '#c5c5c5' },
		--Description { fg = '#989898' }, -- descriptionForeground
		--ProgressBar { fg = '#0e70c0' }, -- progressBar.background
		--MatchedCharacters { fg = blue2 }, -- editorSuggestWidget.highlightForeground
		--Hint { MatchedCharacters }, -- for the hint letter in options, e.g., the q in [q]uickfix
		---- For the unused code, use Identifier's fg (9cdcfe) as the base color,
		---- editorUnnecessaryCode.opacity is 000000aa (the alpha value is aa),
		---- so the color will be 9cdcfeaa. Converting hexa to hex gets 729db4.
		--UnnecessaryCode { fg = '#729db4' },
		---- Git diff
		-- DiffTextAdded { bg = '#386229' },
		-- DiffTextDeleted { bg = '#781212' },
		-- DiffTextChanged { bg = '#0000ff' },
		-- DiffLineAdded { bg = '#373d29' },
		-- DiffLineDeleted { bg = '#4b1818' },
		-- DiffLineChanged { bg = '#0e2f44' },
		---- Quickfix list (can be used to define qf syntax, e.g.,
		---- ~/.config/nvim/syntax/qf.vim)
		--QfFileName { fg = white },
		--QfSelection { bg = '#3a3d41' }, -- terminal.inactiveSelectionBackground
		--QfText { fg = '#bbbbbb' }, -- normal text in quickfix list
		---- Inline hints
		--InlayHint { fg = '#969696', bg = '#232323' }, -- editorInlayHint.foreground/background
		--InlayHintType { InlayHint }, -- editorInlayHint.typeBackground/typeForeground

		----
		---- Editor
		----
		--CursorLine { bg = black3 },
		--CursorColumn { bg = black3 },
		--ColorColumn { bg = black2 }, -- #5a5a5a in VSCode (editorRuler.foreground) it's too bright
		--Conceal { fg = gray2 },
		-- Cursor { fg = p4.fg, bg = p1.fg },
		---- lCursor { },
		---- CursorIM { },
		--Directory { fg = dark_blue },
		DiffAdd { bg = success, fg = n1.fg },
		DiffDelete { bg = remove, fg = n1.fg },
		--DiffChange { DiffLineChanged },
		--DiffText { DiffTextChanged },
		--EndOfBuffer { fg = norm_bg },
		---- TermCursor { },
		---- TermCursorNC { },
		--ErrorMsg { fg = error_red },
		--WinSeparator { fg = '#444444' }, -- editorGroup.border
		--VirtSplit { WinSeparator }, -- deprecated and use WinSeparator instead
		--LineNr { fg = gray2 },
		--CursorLineNr { fg = '#c6c6c6' },
		--Folded { bg = folded_blue },
		--CursorLineFold { CursorLineNr },
		--FoldColumn { LineNr }, -- #c5c5c5 in VSCode (editorGutter.foldingControlForeground) and it's too bright
		--SignColumn { bg = norm_bg },
		IncSearch { bg = n5.fg },
		---- Substitute { },
		--MatchParen { bg = gray, gui = 'bold, underline' },
		--ModeMsg { fg = norm_fg },
		--MsgArea { fg = norm_fg },
		---- MsgSeparator { },
		--MoreMsg { fg = norm_fg },
		--NonText { fg = gray2 },
		Normal { fg = n3.fg, bg = background },
		---- NormalNC { },
		--Pmenu { fg = norm_fg, bg = black2 },
		--PmenuSel { fg = white, bg = selection_blue },
		--PmenuSbar { bg = black2 },
		--PmenuThumb { bg = '#474747' },
		--NormalFloat { Pmenu },
		--Question { fg = dark_blue },
		--QuickFixLine { QfSelection },
		Search { IncSearch },
		--SpecialKey { NonText },
		--SpellBad { gui = 'undercurl', sp = error_red },
		--SpellCap { gui = 'undercurl', sp = warn_yellow},
		--SpellLocal { gui = 'undercurl', sp = info_blue },
		--SpellRare  { gui = 'undercurl', sp = info_blue  },
		--StatusLine { bg = black2 },
		--StatusLineNC { fg = gray, bg = black2 },
		--TabLine { fg = '#8f8f8f', bg = black },
		--TabLineFill { fg = 'NONE', bg = black2 },
		--TabLineSel { fg = white, bg = norm_bg },
		--Title { fg = dark_blue, gui = 'bold' },
		--Visual { bg = '#264F78' },
		---- VisualNOS { },
		--WarningMsg { fg = warn_yellow },
		--Whitespace { fg = '#3e3e3d' },
		--WildMenu { PmenuSel },
		--Winbar { Breadcrumb },
		--WinbarNC { Breadcrumb },

		----
		---- Syntax
		----
		--Comment { fg = green, gui = 'italic' },

		--Constant { fg = dark_blue },
		--String { fg = brown },
		--Character { Constant },
		--Number { fg = light_green },
		--Boolean { Constant },
		--Float { Number },

		--Identifier { fg = light_blue },
		Function { fg = p4.fg },

		--Statement { fg = dark_pink },
		--Conditional { Statement },
		--Repeat { Statement },
		--Label { Statement },
		--Operator { fg = norm_fg },
		--Keyword { fg = dark_blue },
		--Exception { Statement },

		--PreProc { fg = dark_pink },
		--Include { PreProc },
		--Define { PreProc },
		--Macro { PreProc },
		--PreCondit { PreProc },

		--Type { fg = dark_blue },
		--StorageClass { Type },
		--Structure { Type },
		--Typedef { Type },

		--Special { fg = yellow_orange },
		--SpecialChar { Special },
		--Tag { Special },
		--Delimiter { Special },
		--SpecialComment { Special },
		--Debug { Special },

		--Underlined { gui = "underline" },
		---- Ignore { },
		--Error { fg = error_red },
		--Todo { fg = norm_bg, bg = yellow_orange, gui = 'bold' },

		----
		---- diff
		----
		---- VSCode doesn't have foreground for git added/removed/changed, so here I
		---- use the corresponding colors for gutter instead.
		--diffAdded { GutterGitAdded },
		--diffRemoved { GutterGitDeleted },
		--diffChanged { GutterGitModified },

		----
		---- LSP
		----
		--LspReferenceText { SelectionHighlightBackground },
		--LspReferenceRead { SelectionHighlightBackground },
		--LspReferenceWrite { SelectionHighlightBackground },
		--LspCodeLens { CodeLens },
		---- LspCodeLensSeparator { }, -- Used to color the seperator between two or more code lens.
		--LspSignatureActiveParameter { MatchedCharacters },
		--LspInlayHint { InlayHint },

		----
		---- Diagnostics
		----
		DiagnosticError { fg = errorFg },
		DiagnosticWarn { fg = warnFg },
		DiagnosticInfo { fg = n2.fg },
		DiagnosticHint { fg = n1.fg },
		--DiagnosticOk { fg = ok_green },
		--DiagnosticVirtualTextError { DiagnosticError, bg = '#332323' },
		--DiagnosticVirtualTextWarn { DiagnosticWarn, bg = '#2f2c1b' },
		--DiagnosticVirtualTextInfo { DiagnosticInfo, bg = '#212a35' },
		--DiagnosticVirtualTextHint { DiagnosticHint, bg = black },
		--DiagnosticVirtualTextOk { DiagnosticOk, bg = '#233323' },
		DiagnosticUnderlineError { gui = 'undercurl', fg = errorFg },
		DiagnosticUnderlineWarn { gui = 'undercurl', fg = warnFg },
		DiagnosticUnderlineInfo { gui = 'undercurl', fg = a1.fg },
		--DiagnosticUnderlineHint { gui = 'undercurl', sp = hint_gray },
		--DiagnosticUnderlineOk { gui = 'undercurl', sp = ok_green },
		--DiagnosticFloatingError { DiagnosticError },
		--DiagnosticFloatingWarn { DiagnosticWarn },
		--DiagnosticFloatingInfo { DiagnosticInfo },
		--DiagnosticFloatingHint { DiagnosticHint },
		--DiagnosticFloatingOk { DiagnosticOk },
		--DiagnosticSignError { DiagnosticError },
		--DiagnosticSignWarn { DiagnosticWarn },
		--DiagnosticSignInfo { DiagnosticInfo },
		--DiagnosticSignHint { DiagnosticHint },
		--DiagnosticSignOk { DiagnosticOk },
		--DiagnosticUnnecessary { UnnecessaryCode, gui = 'underdashed' },
		--DiagnosticDeprecated { fg = gray3, gui = 'strikethrough' },

		----
		---- Treesitter
		----
		---- The obsolete TS* highlight groups are removed since this commit
		---- https://github.com/nvim-treesitter/nvim-treesitter/commit/42ab95d5e11f247c6f0c8f5181b02e816caa4a4f
		---- Now use the capture names directly as the highlight groups.
		---- (1). How to define the highlight group, see https://github.com/rktjmp/lush.nvim/issues/109
		---- (2). To find all the capture names, see https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights)

		---- Misc
    sym("@tskeywordcontrolflow") { fg = p1.fg, gui = p1.gui },
    -- Defined by nvim_controlflow_queries
    sym("@control_flow") { fg = p1.fg, gui = p1.gui },

		sym("@comment") { fg = c1.fg, bg = c6.fg },
		sym("@comment.documentation") { sym("@comment") },
		-- sym("@error") { fg = error },
		sym("@none") {},
		-- sym("@preproc") { },
		-- sym("@define") { },
		sym("@operator") { fg = p4.fg },

		---- Punctuation
		sym("@punctuation.delimiter") { fg = p3.fg },
		sym("@punctuation.bracket") { fg = p2.fg },
		sym("@punctuation.special") { fg = p2.fg },
    sym("@punctuation") { fg = n4.fg },

		---- Literals
		sym("@string") { fg = p6.fg },
		sym("@string.documentation") { fg = "red" },
		sym("@string.regex") { fg = p6.fg },
		sym("@string.escape") { fg = p5.fg },
		sym("@string.special") {  fg = p5.fg},
		sym("@character") {  fg = p6.fg},
		sym("@character.special") {  fg = p5.fg},
		sym("@boolean") {  fg = p6.fg},
		sym("@number") { fg = p6.fg },
		sym("@float") { fg = p6.fg },

		---- Function
		-- sym("@function") { Function },
		sym("@function.builtin") { fg = a2.fg },
		sym("@function.call") { P1 },
		--sym("@function.macro") { Function },
		sym("@method") { P6 },
		sym("@method.call") { P1 },
		--sym("@constructor") { fg = blue_green },
		sym("@parameter") { fg = p4.fg },

		---- Keyword
		sym("@keyword") { P6 },
		--sym("@keyword.coroutine") { fg = dark_pink },
		--sym("@keyword.function") { fg = dark_blue },
		--sym("@keyword.operator") { fg = norm_fg },
		--sym("@keyword.return") { fg = dark_pink },
		sym("@conditional") { P1 },
		sym("@conditional.ternary") { P1 },
		---- sym("@repeat") { },
		---- sym("@debug") { },
		--sym("@label") { fg = label_fg },
		sym("@include") { fg = n4.fg },
		---- sym("@exception") { },

		---- Types
		sym("@type") { A1 },
    -- TODO: Math.x math is detected as type
		sym("@type.builtin") { A2 },
		--sym("@type.definition") { fg = blue_green },
		--sym("@type.qualifier") { fg = dark_blue },
		sym("@storageclass") { fg = p4.fg },
		sym("@attribute") { fg = p4.fg },
		sym("@field") { fg = p4.fg },
		sym("@property") { fg = p4.fg },

		---- Identifiers
		sym("@variable") { P6 },
		sym("@variable.builtin") { P6 },
		sym("@constant") { fg = p3.fg },
		sym("@constant.builtin") { fg = p3.fg },
		--sym("@constant.macro") { Constant },
		sym("@namespace") { fg = p4.fg },
		---- sym("@symbol") { },

		---- Text (Mainly for markup languages)
		--sym("@text") { fg = norm_fg },
		--sym("@text.strong") { fg = norm_fg, gui = 'bold' },
		--sym("@text.emphasis") { fg = norm_fg, gui = 'italic' },
		--sym("@text.underline") { fg = norm_fg, gui = 'underline' },
		--sym("@text.strike") { fg = norm_fg, gui = 'strikethrough' },
		--sym("@text.title") { Title, gui = 'bold' },
		--sym("@text.literal") { fg = brown },
		---- sym("@text.quote") { },
		sym("@text.uri") { fg = n2.fg },
		--sym("@text.math") { fg = blue_green },
		---- sym("@text.environment") { },
		---- sym("@text.environment.name") { },
		--sym("@text.reference") { fg = brown },
		--sym("@text.todo") { Todo },
		--sym("@text.note") { fg = info_blue },
		--sym("@text.warning") { fg = warn_yellow },
		--sym("@text.danger") { fg = error_red },
		--sym("@text.diff.add") { DiffTextAdded },
		--sym("@text.diff.delete") { DiffTextDeleted },

		---- Tags
		sym("@tag") { fg = p1.fg, gui = p1.gui },
		sym("@constructor") { fg = p1.fg, gui = p1.gui },
		sym("@tag.attribute") { fg = p6.fg },
		--sym("@tag.delimiter") { fg = gray3 },

		---- Conceal
		---- sym("@conceal") { },

		---- Spell
		---- sym("@spell") { },
		---- sym("@nospell") { },

		----
		---- LSP semantic tokens
		----
		---- The help page :h lsp-semantic-highlight
		---- A short guide: https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
		---- Token types and modifiers are described here: https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide
		-- sym("@lsp") { sym("@none") },
		-- sym("@lsp.type.property") { fg = p5.fg},
		-- sym("@lsp.type.namespace") { sym("@namespace") },
		-- sym("@lsp.type.interface") { sym("@type") },
		-- sym("@lsp.type.type") { sym("@type") },
		-- sym("@lsp.mod.declaration.type.type") { sym("@type") },
		-- sym("@lsp.type.parameter") { fg = p5.fg },
		-- sym("@lsp.type.variable") { fg = p5.fg },
		-- sym("@lsp.type.class") { fg = p5.fg },
		-- sym("@lsp.mod.declaration") { fg = p5.fg },
		-- sym("@lsp.mod.defaultLibrary") { sym("@none") },
		-- sym("@lsp.typemod.method.defaultLibrary") { sym("@none") },
		-- sym("@lsp.typemod.class.defaultLibrary") { sym("@none") },

		-- sym("@lsp.type.function") { fg = p1.fg, gui = p1.gui },
		-- sym("@lsp.type.method") { fg = p1.fg, gui = p1.gui },

		--sym("@lsp.type.enum") { fg = blue_green },
		--sym("@lsp.type.struct") { fg = blue_green },
		--sym("@lsp.type.typeParameter") { fg = blue_green },
		--sym("@lsp.type.parameter") { fg = orange }, -- Use a conspicuous color for semantic parameters (VSCode uses the common light_blue)
		--sym("@lsp.type.variable") { fg = light_blue },
		--sym("@lsp.type.enumMember") { fg = blue },
		---- sym("@lsp.type.event") { },  -- TODO: what is event property?
		--sym("@lsp.type.macro") { fg = dark_blue },
		--sym("@lsp.type.keyword") { fg = dark_blue },
		--sym("@lsp.type.modifier") { fg = dark_blue },
		--sym("@lsp.type.comment") { fg = green },
		-- sym("@lsp.type.string") { fg = 'red' },
		--sym("@lsp.type.number") { fg = light_green },
		--sym("@lsp.type.regexp") { fg = dark_red },
		--sym("@lsp.type.operator") { fg = norm_fg },
		--sym("@lsp.type.decorator") { fg = yellow },
		--sym("@lsp.type.escapeSequence") { fg = yellow_orange },
		--sym("@lsp.type.formatSpecifier") { fg = light_blue },
		--sym("@lsp.type.builtinType") { fg = dark_blue },
		--sym("@lsp.type.typeAlias") { fg = blue_green },
		--sym("@lsp.type.unresolvedReference") { gui = 'undercurl', sp = error_red },
		--sym("@lsp.type.lifetime") { sym("@storageclass") },
		--sym("@lsp.type.generic") { sym("@variable") },
		--sym("@lsp.type.selfTypeKeyword") { sym("@variable.builtin") },
		--sym("@lsp.type.deriveHelper") { sym("@attribute") },
		--sym("@lsp.typemod.type.defaultLibrary") { fg = blue_green },
		--sym("@lsp.typemod.typeAlias.defaultLibrary") { sym("@lsp.typemod.type.defaultLibrary") },
		--sym("@lsp.typemod.class.defaultLibrary") { fg = blue_green },
		--sym("@lsp.typemod.variable.defaultLibrary") { fg = dark_blue },
		--sym("@lsp.typemod.function.defaultLibrary") { Function },
		--sym("@lsp.typemod.macro.defaultLibrary") { Function },
		--sym("@lsp.typemod.struct.defaultLibrary") { sym("@type.builtin") },
		---- sym("@lsp.typemod.enum.defaultLibrary") {},
		---- sym("@lsp.typemod.enumMember.defaultLibrary") {},
		--sym("@lsp.typemod.variable.readonly") { fg = blue },
		--sym("@lsp.typemod.variable.callable") { sym("@function") },
		--sym("@lsp.typemod.variable.static") { sym("@constant") },
		--sym("@lsp.typemod.property.readonly") { fg = blue },
		--sym("@lsp.typemod.keyword.async") { fg = dark_pink },
		--sym("@lsp.typemod.keyword.injected") { sym("@keyword") },
		---- Set injected highlights. Mainly for Rust doc comments and also works for
		---- other lsps that inject tokens in comments.
		---- Ref: https://github.com/folke/tokyonight.nvim/pull/340
		--sym("@lsp.typemod.operator.injected") { sym("@lsp.type.operator") },
		--sym("@lsp.typemod.string.injected") { sym("@lsp.type.string") },
		--sym("@lsp.typemod.variable.injected") { sym("@lsp.type.variable") },

		----
		---- nvim-lspconfig
		----
		---- LspInfoTitle { },
		---- LspInfoList { },
		---- LspInfoFiletype { },
		---- LspInfoTip { },
		--LspInfoBorder { FloatBorder },

		----
		---- nvim-cmp
		----
		--CmpItemAbbrDeprecated { fg = gray3, bg = 'NONE', gui = 'strikethrough' },
		--CmpItemAbbrMatch { MatchedCharacters, bg = 'NONE' },
		--CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },
		--CmpItemMenu { Description },
		--CmpItemKindText { fg = '#cccccc', bg = 'NONE' },
		--CmpItemKindMethod { fg = '#b180d7', bg = 'NONE' },
		--CmpItemKindFunction { CmpItemKindMethod },
		--CmpItemKindConstructor { CmpItemKindFunction },
		--CmpItemKindField { fg = '#75beff', bg = 'NONE' },
		--CmpItemKindVariable { CmpItemKindField },
		--CmpItemKindClass { fg = '#ee9d28', bg = 'NONE' },
		--CmpItemKindInterface { CmpItemKindField },
		--CmpItemKindModule { CmpItemKindText },
		--CmpItemKindProperty { CmpItemKindText },
		--CmpItemKindUnit { CmpItemKindText },
		--CmpItemKindValue { CmpItemKindText },
		--CmpItemKindEnum { CmpItemKindClass },
		--CmpItemKindKeyword { CmpItemKindText },
		--CmpItemKindSnippet { CmpItemKindText },
		--CmpItemKindColor { CmpItemKindText },
		--CmpItemKindFile { CmpItemKindText },
		--CmpItemKindReference { CmpItemKindText },
		--CmpItemKindFolder { CmpItemKindText },
		--CmpItemKindEnumMember { CmpItemKindField },
		--CmpItemKindConstant { CmpItemKindText },
		--CmpItemKindStruct { CmpItemKindText },
		--CmpItemKindEvent { CmpItemKindClass },
		--CmpItemKindOperator { CmpItemKindText },
		--CmpItemKindTypeParameter { CmpItemKindText },
		---- Predefined for the winhighlight config of cmp float window
		--SuggestWidgetBorder { FloatBorder },
		--SuggestWidgetSelect { bg = selection_blue },

		----
		---- Aerial
		----
		--AerialTextIcon { CmpItemKindText },
		--AerialMethodIcon { CmpItemKindMethod },
		--AerialFunctionIcon { CmpItemKindFunction },
		--AerialConstructorIcon { CmpItemKindConstructor },
		--AerialFieldIcon { CmpItemKindField },
		--AerialVariableIcon { CmpItemKindVariable },
		--AerialClassIcon { CmpItemKindClass },
		--AerialInterfaceIcon { CmpItemKindInterface },
		--AerialModuleIcon { CmpItemKindModule },
		--AerialPropertyIcon { CmpItemKindProperty },
		--AerialUnitIcon { CmpItemKindUnit },
		--AerialValueIcon { CmpItemKindValue },
		--AerialEnumIcon { CmpItemKindEnum },
		--AerialKeywordIcon { CmpItemKindKeyword },
		--AerialSnippetIcon { CmpItemKindSnippet },
		--AerialColorIcon { CmpItemKindColor },
		--AerialFileIcon { CmpItemKindFile },
		--AerialReferenceIcon { CmpItemKindReference },
		--AerialFolderIcon { CmpItemKindFolder },
		--AerialEnumMemberIcon { CmpItemKindEnumMember },
		--AerialConstantIcon { CmpItemKindConstant },
		--AerialStructIcon { CmpItemKindStruct },
		--AerialEventIcon { CmpItemKindEvent },
		--AerialOperatorIcon { CmpItemKindOperator },
		--AerialTypeParameterIcon { CmpItemKindTypeParameter },

		----
		---- nvim-navic
		----
		--NavicText { Winbar },
		--NavicIconsFile { CmpItemKindFile },
		--NavicIconsModule { CmpItemKindModule },
		--NavicIconsNamespace { NavicText },
		--NavicIconsPackage { NavicText },
		--NavicIconsClass { CmpItemKindClass },
		--NavicIconsMethod { CmpItemKindMethod },
		--NavicIconsProperty { CmpItemKindProperty },
		--NavicIconsField { CmpItemKindField },
		--NavicIconsConstructor { CmpItemKindConstructor },
		--NavicIconsEnum { CmpItemKindEnum },
		--NavicIconsInterface { CmpItemKindInterface },
		--NavicIconsFunction { CmpItemKindFunction },
		--NavicIconsVariable { CmpItemKindVariable },
		--NavicIconsConstant { CmpItemKindConstant },
		--NavicIconsString { NavicText },
		--NavicIconsNumber { NavicText },
		--NavicIconsBoolean { NavicText },
		--NavicIconsArray { NavicText },
		--NavicIconsObject { NavicText },
		--NavicIconsKey { NavicText },
		--NavicIconsNull { NavicText },
		--NavicIconsEnumMember { CmpItemKindEnumMember },
		--NavicIconsStruct { CmpItemKindStruct },
		--NavicIconsEvent { CmpItemKindEvent },
		--NavicIconsOperator { CmpItemKindOperator },
		--NavicIconsTypeParameter { CmpItemKindTypeParameter },
		--NavicSeparator { NavicText },

		----
		---- Gitsigns
		----
		--GitSignsAdd { GutterGitAdded },
		--GitSignsChange { GutterGitModified },
		--GitSignsDelete { GutterGitDeleted },
		--GitSignsAddNr { GitSignsAdd },
		--GitSignsChangeNr { GitSignsChange },
		--GitSignsDeleteNr { GitSignsDelete },
		--GitSignsAddLn { DiffAdd },
		--GitSignsChangeLn { DiffChange },
		--GitSignsDeleteLn { DiffDelete },
		--GitSignsAddInline { DiffTextAdded },
		--GitSignsChangeInline { DiffTextChanged },
		--GitSignsDeleteInline { DiffTextDeleted },

		----
		---- vim-illuminate
		----
		--IlluminatedWordText { SelectionHighlightBackground },
		--IlluminatedWordRead { SelectionHighlightBackground },
		--IlluminatedWordWrite { SelectionHighlightBackground },

		----
		---- Telescope
		----
		--TelescopeBorder { FloatBorder },
		--TelescopePromptBorder { TelescopeBorder },
		--TelescopeResultsBorder { TelescopePromptBorder },
		--TelescopePreviewBorder { TelescopePromptBorder },
		--TelescopeSelection { PmenuSel },
		--TelescopeSelectionCaret { TelescopeSelection },
		--TelescopeMultiIcon { fg = blue_green },
		--TelescopeMatching { CmpItemAbbrMatch },
		--TelescopeNormal { Normal },
		--TelescopePromptPrefix { Icon },

		----
		---- Harpoon
		----
		--HarpoonBorder { TelescopeBorder },
		--HarpoonWindow { TelescopeNormal },

		----
		---- fFHighlight
		----
		--fFHintWords { gui = 'underline', sp = 'yellow' },
		--fFHintCurrentWord { gui = 'undercurl', sp = 'yellow' },

		----
		---- indent-blankline
		----
		IblIndent { fg = n5.fg },
    IndentBlanklineIndent { fg = n5.fg },
		IblScope { fg = n5.fg },

		----
		---- hlslens
		----
		--HlSearchNear { IncSearch },
		--HlSearchLens { Description },
		--HlSearchLensNear { HlSearchLens },

		----
		---- nvim-ufo
		----
		--UfoPreviewBorder { PeekViewBorder },
		--UfoPreviewNormal { PeekViewNormal },
		--UfoPreviewCursorLine { PeekViewCursorLine },
		--UfoFoldedFg { fg = norm_fg },
		--UfoFoldedBg { bg = folded_blue },
		--UfoCursorFoldedLine { bg = '#2F3C48', gui = 'bold, italic' },
		--UfoPreviewSbar { PeekViewNormal },
		--UfoPreviewThumb { bg = '#394a4b' },
		--UfoFoldedEllipsis { fg = '#989ca0' },

		----
		---- nvim-bqf
		----
		--BqfPreviewFloat { PeekViewNormal },
		--BqfPreviewBorder { PeekViewBorder },
		--BqfPreviewTitle { PeekViewTitle },
		--BqfPreviewSbar { PmenuSbar },
		--BqfPreviewThumb { PmenuThumb },
		--BqfPreviewCursor { Cursor },
		--BqfPreviewCursorLine { PeekViewCursorLine },
		--BqfPreviewRange { PeekViewMatchHighlight },
		--BqfPreviewBufLabel { Description },
		--BqfSign { fg = blue_green },

		----
		---- mg979/tabline.nvim
		----
		--TSelect { TabLineSel },
		--TVisible { TabLine },
		--THidden { TabLine },
		--TExtra { TabLine },
		--TSpecial { TabLine },
		--TFill { TabLineFill },
		--TCorner { fg = white, bg = black2 },
		--TNumSel { TSelect },
		--TNum { TabLine },
		--TSelectMod { TSelect },
		--TVisibleMod { TVisible },
		--THiddenMod { THidden },
		--TExtraMod { TExtra },
		--TSpecialMod { TSpecial },
		--TSelectDim { TSelect },
		--TVisibleDim { TVisible },
		--THiddenDim { THidden },
		--TExtraDim { TExtra },
		--TSpecialDim { TSpecial },
		--TSelectSep { TabBorder },
		--TVisibleSep { TabBorder },
		--THiddenSep { TabBorder },
		--TExtraSep { TabBorder },
		--TSpecialSep { TabBorder },

		----
		---- git-messenger.vim
		----
		--gitmessengerHeader { fg = '#3794ff' },  -- textLink.activeForeground
		--gitmessengerPopupNormal { NormalFloat },
		--gitmessengerHash { NormalFloat },
		--gitmessengerHistory { NormalFloat },
		--gitmessengerEmail { NormalFloat },

		----
		---- nvim-treesitter-context
		----
		---- TreesitterContext { bg = black4 },
		--TreesitterContextLineNumber { fg = '#5d5d5d' }, -- 30% darker based on LineNr
		--TreesitterContextBottom { gui = 'underline', sp = FloatBorder.fg },

		----
		---- nvim-scrollview
		----
		--ScrollView { ScrollbarSlider },
		--ScrollViewRestricted { ScrollView },
		--ScrollViewConflictsTop { DiffAdd },
		--ScrollViewConflictsMiddle { DiffAdd },
		--ScrollViewConflictsBottom { DiffAdd },
		--ScrollViewCursor { CursorLineNr },
		--ScrollViewDiagnosticsError { DiagnosticError },
		--ScrollViewDiagnosticsWarn { DiagnosticWarn },
		--ScrollViewDiagnosticsHint { DiagnosticHint },
		--ScrollViewDiagnosticsInfo { DiagnosticInfo },
		--ScrollViewSearch { fg = '#9e6a03' },

		----
		---- vim-floaterm
		----
		--Floaterm { Normal },
		--FloatermBorder { FloatBorder },

		----
		---- quick-scope
		----
		--QuickScopePrimary { fg = bright_pink, gui = 'underline', sp = bright_pink },
		--QuickScopeSecondary { fg = purple, gui = 'underline', sp = purple },

		---
		--- buftabline
    BufTabLineFill { bg = background },
    BufTabLineCurrent { fg = n6.fg, bg = n1.fg},
    BufTabLineModifiedCurrent { fg = n6.fg, bg = a1.fg, gui = 'bold' },
    BufTabLineActive { fg = n5.fg,  bg = n3.fg },
    BufTabLineModifiedActive { fg = n3.fg, bg = a5.fg, gui = 'bold' },
    BufTabLineHidden { fg = n3.fg , bg = background },
    BufTabLineModifiedHidden { fg = n3.fg, bg = background, gui = 'bold' },
      --- {{{ DropBar
    -- DropBarCurrentContext	{ link = 'Visual' }
    -- DropBarFzfMatch	{ link = 'TelescopeMatching' }
    -- DropBarHover	{ link = 'Visual' }
    -- DropBarIconCurrentContext	{ link = 'Visual' }
    -- DropBarIconKindArray	{ link = 'Array' }
    -- DropBarIconKindBoolean	{ link = 'Boolean' }
    -- DropBarIconKindBreakStatement	{ link = 'Error' }
    -- DropBarIconKindCall	{ link = 'Function' }
    -- DropBarIconKindCaseStatement	{ link = 'Conditional' }
    -- DropBarIconKindClass	{ link = 'CmpItemKindClass' }
    -- DropBarIconKindConstant	{ link = 'Constant' }
    -- DropBarIconKindConstructor	{ link = 'CmpItemKindConstructor' }
    -- DropBarIconKindContinueStatement	{ link = 'Repeat' }
    -- DropBarIconKindDeclaration	{ link = 'CmpItemKindSnippet' }
    -- DropBarIconKindDelete	{ link = 'Error' }
    -- DropBarIconKindDoStatement	{ link = 'Repeat' }
    -- DropBarIconKindElseStatement	{ link = 'Conditional' }
    -- DropBarIconKindEnum	{ link = 'CmpItemKindEnum' }
    -- DropBarIconKindEnumMember	{ link = 'CmpItemKindEnumMember' }
    -- DropBarIconKindEvent	{ link = 'CmpItemKindEvent' }
    -- DropBarIconKindField	{ link = 'CmpItemKindField' }
    -- DropBarIconKindFile	{ link = 'NormalFloat' }
    -- DropBarIconKindFolder	{ link = 'Directory' }
    -- DropBarIconKindForStatement	{ link = 'Repeat' }
    -- DropBarIconKindFunction	{ link = 'Function' }
    -- DropBarIconKindH1Marker	{ link = 'markdownH1' }
    -- DropBarIconKindH2Marker	{ link = 'markdownH2' }
    -- DropBarIconKindH3Marker	{ link = 'markdownH3' }
    -- DropBarIconKindH4Marker	{ link = 'markdownH4' }
    -- DropBarIconKindH5Marker	{ link = 'markdownH5' }
    -- DropBarIconKindH6Marker	{ link = 'markdownH6' }
    -- DropBarIconKindIdentifier	{ link = 'CmpItemKindVariable' }
    -- DropBarIconKindIfStatement	{ link = 'Conditional' }
    -- DropBarIconKindInterface	{ link = 'CmpItemKindInterface' }
    -- DropBarIconKindKeyword	{ link = 'Keyword' }
    -- DropBarIconKindList	{ link = 'SpecialChar' }
    -- DropBarIconKindMacro	{ link = 'Macro' }
    -- DropBarIconKindMarkdownH1	{ link = 'markdownH1' }
    -- DropBarIconKindMarkdownH2	{ link = 'markdownH2' }
    -- DropBarIconKindMarkdownH3	{ link = 'markdownH3' }
    -- DropBarIconKindMarkdownH4	{ link = 'markdownH4' }
    -- DropBarIconKindMarkdownH5	{ link = 'markdownH5' }
    -- DropBarIconKindMarkdownH6	{ link = 'markdownH6' }
    -- DropBarIconKindMethod	{ link = 'CmpItemKindMethod' }
    -- DropBarIconKindModule	{ link = 'CmpItemKindModule' }
    -- DropBarIconKindNamespace	{ link = 'NameSpace' }
    -- DropBarIconKindNull	{ link = 'Constant' }
    -- DropBarIconKindNumber	{ link = 'Number' }
    -- DropBarIconKindObject	{ link = 'Statement' }
    -- DropBarIconKindOperator	{ link = 'Operator' }
    -- DropBarIconKindPackage	{ link = 'CmpItemKindModule' }
    -- DropBarIconKindPair	{ link = 'String' }
    -- DropBarIconKindProperty	{ link = 'CmpItemKindProperty' }
    -- DropBarIconKindReference	{ link = 'CmpItemKindReference' }
    -- DropBarIconKindRepeat	{ link = 'Repeat' }
    -- DropBarIconKindScope	{ link = 'NameSpace' }
    -- DropBarIconKindSpecifier	{ link = 'Specifier' }
    -- DropBarIconKindStatement	{ link = 'Statement' }
    -- DropBarIconKindString	{ link = 'String' }
    -- DropBarIconKindStruct	{ link = 'CmpItemKindStruct' }
    -- DropBarIconKindSwitchStatement	{ link = 'Conditional' }
    -- DropBarIconKindTerminal	{ link = 'Number' }
    -- DropBarIconKindType	{ link = 'CmpItemKindClass' }
    -- DropBarIconKindTypeParameter	{ link = 'CmpItemKindTypeParameter' }
    -- DropBarIconKindUnit	{ link = 'CmpItemKindUnit' }
    -- DropBarIconKindValue	{ link = 'Number' }
    -- DropBarIconKindVariable	{ link = 'CmpItemKindVariable' }
    -- DropBarIconKindWhileStatement	{ link = 'Repeat' }
    -- DropBarIconUIIndicator	{ link = 'SpecialChar' }
    -- DropBarIconUIPickPivot	{ link = 'Error' }
    -- DropBarIconUISeparator	{ link = 'SpecialChar' }
    -- DropBarIconUISeparatorMenu	{ link = 'DropBarIconUISeparator' }
    -- DropBarMenuCurrentContext	{ link = 'PmenuSel' }
    -- DropBarMenuFloatBorder	{ link = 'FloatBorder' }
    -- DropBarMenuHoverEntry	{ link = 'Visual' }
    -- DropBarMenuHoverIcon	{ reverse = true }
    -- DropBarMenuHoverSymbol	{ bold = true }
    -- DropBarMenuNormalFloat	{ link = 'NormalFloat' }
    -- DropBarMenuSbar	{ link = 'PmenuSbar' }
    -- DropBarMenuThumb	{ link = 'PmenuThumb' }
    -- DropBarPreview	{ link = 'Visual' }
    -- DropBarKindArray	undefined
    -- DropBarKindBoolean	undefined
    -- DropBarKindBreakStatement	undefined
    -- DropBarKindCall	undefined
    -- DropBarKindCaseStatement	undefined
    -- DropBarKindClass	undefined
    -- DropBarKindConstant	undefined
    -- DropBarKindConstructor	undefined
    -- DropBarKindContinueStatement	undefined
    -- DropBarKindDeclaration	undefined
    -- DropBarKindDelete	undefined
    -- DropBarKindDoStatement	undefined
    -- DropBarKindElseStatement	undefined
    -- DropBarKindEnum	undefined
    -- DropBarKindEnumMember	undefined
    -- DropBarKindEvent	undefined
    -- DropBarKindField	undefined
    -- DropBarKindFile	undefined
    -- DropBarKindFolder	undefined
    -- DropBarKindForStatement	undefined
    -- DropBarKindFunction	undefined
    -- DropBarKindH1Marker	undefined
    -- DropBarKindH2Marker	undefined
    -- DropBarKindH3Marker	undefined
    -- DropBarKindH4Marker	undefined
    -- DropBarKindH5Marker	undefined
    -- DropBarKindH6Marker	undefined
    -- DropBarKindIdentifier	undefined
    -- DropBarKindIfStatement	undefined
    -- DropBarKindInterface	undefined
    -- DropBarKindKeyword	undefined
    -- DropBarKindList	undefined
    -- DropBarKindMacro	undefined
    -- DropBarKindMarkdownH1	undefined
    -- DropBarKindMarkdownH2	undefined
    -- DropBarKindMarkdownH3	undefined
    -- DropBarKindMarkdownH4	undefined
    -- DropBarKindMarkdownH5	undefined
    -- DropBarKindMarkdownH6	undefined
    -- DropBarKindMethod	undefined
    -- DropBarKindModule	undefined
    -- DropBarKindNamespace	undefined
    -- DropBarKindNull	undefined
    -- DropBarKindNumber	undefined
    -- DropBarKindObject	undefined
    -- DropBarKindOperator	undefined
    -- DropBarKindPackage	undefined
    -- DropBarKindProperty	undefined
    -- DropBarKindReference	undefined
    -- DropBarKindRepeat	undefined
    -- DropBarKindScope	undefined
    -- DropBarKindSpecifier	undefined
    -- DropBarKindStatement	undefined
    -- DropBarKindString	undefined
    -- DropBarKindStruct	undefined
    -- DropBarKindSwitchStatement	undefined
    -- DropBarKindTerminal	undefined
    -- DropBarKindType	undefined
    -- DropBarKindTypeParameter	undefined
    -- DropBarKindUnit	undefined
    -- DropBarKindValue	undefined
    -- DropBarKindVariable	undefined
    -- DropBarKindWhileStatement	undefined
      -- }}}
	}
	end)
end

-- Flip this to true so you can use `:Lushify`
local __DEV = false
if __DEV then
	return themeFunc({})
else
	return themeFunc
end

-- vi:nowrap
