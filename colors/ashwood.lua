-- Ashwood v2 / Parchment v2 colorscheme for Neovim
-- High-contrast variant: body text ~17:1 dark, ~18:1 light; accents all WCAG AAA
--
-- Install: copy to ~/.config/nvim/colors/ashwood.lua
-- Usage:
--   vim.o.background = 'dark'    -- Ashwood v2
--   vim.o.background = 'light'   -- Parchment v2
--   vim.cmd('colorscheme ashwood')

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') == 1 then vim.cmd('syntax reset') end
vim.g.colors_name = 'ashwood'

local dark = vim.o.background ~= 'light'

local p = {}
if dark then
  p = {
    bg0      = '#0e1016',
    bg1      = '#181b24',
    bg2      = '#242838',
    bg3      = '#2e3448',
    bg4      = '#303550',
    fg0      = '#f2f2f8',
    fg1      = '#9098b4',
    fg2      = '#5c6480',
    red      = '#ff8090',
    orange   = '#ff9860',
    yellow   = '#f5c040',
    green    = '#7ed84a',
    teal     = '#38dcc8',
    blue     = '#60b8ff',
    purple   = '#d878ff',
    pink     = '#ff70bc',
    cursor   = '#ffc840',
    err_bg   = '#2a1018',
    warn_bg  = '#221a08',
    info_bg  = '#101e30',
    hint_bg  = '#0c2020',
    diff_add = '#102010',
    diff_del = '#281018',
    diff_chg = '#101828',
  }
else
  p = {
    bg0      = '#fdfaf2',
    bg1      = '#f0ece0',
    bg2      = '#e0dace',
    bg3      = '#cec8bc',
    bg4      = '#bbb4a8',
    fg0      = '#101014',
    fg1      = '#606070',
    fg2      = '#9898a8',
    red      = '#b01818',
    orange   = '#903000',
    yellow   = '#684200',
    green    = '#205800',
    teal     = '#004848',
    blue     = '#0e3c8c',
    purple   = '#481898',
    pink     = '#740048',
    cursor   = '#b07000',
    err_bg   = '#fae8e8',
    warn_bg  = '#faf0dc',
    info_bg  = '#e8eef8',
    hint_bg  = '#e0eeee',
    diff_add = '#e4f4d8',
    diff_del = '#fae8e8',
    diff_chg = '#e4eaf8',
  }
end

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor base ─────────────────────────────────────────────────────────────
hi('Normal',          { fg = p.fg0, bg = p.bg0 })
hi('NormalFloat',     { fg = p.fg0, bg = p.bg1 })
hi('NormalNC',        { fg = p.fg1, bg = p.bg0 })
hi('ColorColumn',     { bg = p.bg1 })
hi('Conceal',         { fg = p.fg2 })
hi('Cursor',          { fg = p.bg0, bg = p.cursor })
hi('CursorLine',      { bg = p.bg1 })
hi('CursorLineNr',    { fg = p.orange, bg = p.bg1, bold = true })
hi('CursorColumn',    { bg = p.bg1 })
hi('Directory',       { fg = p.blue, bold = true })
hi('EndOfBuffer',     { fg = p.bg2 })
hi('ErrorMsg',        { fg = p.red, bold = true })
hi('FloatBorder',     { fg = p.fg2, bg = p.bg1 })
hi('FloatTitle',      { fg = p.blue, bg = p.bg1, bold = true })
hi('FoldColumn',      { fg = p.fg2, bg = p.bg0 })
hi('Folded',          { fg = p.fg1, bg = p.bg2 })
hi('IncSearch',       { fg = p.bg0, bg = p.orange, bold = true })
hi('Search',          { fg = p.bg0, bg = p.yellow })
hi('CurSearch',       { fg = p.bg0, bg = p.orange, bold = true })
hi('LineNr',          { fg = p.fg2 })
hi('MatchParen',      { fg = p.teal, bold = true, underline = true })
hi('ModeMsg',         { fg = p.green, bold = true })
hi('MoreMsg',         { fg = p.green })
hi('NonText',         { fg = p.bg3 })
hi('Pmenu',           { fg = p.fg0, bg = p.bg1 })
hi('PmenuSel',        { fg = p.bg0, bg = p.blue, bold = true })
hi('PmenuSbar',       { bg = p.bg2 })
hi('PmenuThumb',      { bg = p.fg2 })
hi('Question',        { fg = p.green })
hi('QuickFixLine',    { fg = p.yellow, bold = true })
hi('SignColumn',      { fg = p.fg2, bg = p.bg0 })
hi('SpecialKey',      { fg = p.fg2 })
hi('SpellBad',        { undercurl = true, sp = p.red })
hi('SpellCap',        { undercurl = true, sp = p.yellow })
hi('SpellLocal',      { undercurl = true, sp = p.teal })
hi('SpellRare',       { undercurl = true, sp = p.purple })
hi('StatusLine',      { fg = p.fg0, bg = p.bg1 })
hi('StatusLineNC',    { fg = p.fg2, bg = p.bg1 })
hi('Substitute',      { fg = p.bg0, bg = p.orange })
hi('TabLine',         { fg = p.fg1, bg = p.bg1 })
hi('TabLineFill',     { bg = p.bg1 })
hi('TabLineSel',      { fg = p.fg0, bg = p.bg2, bold = true })
hi('Title',           { fg = p.blue, bold = true })
hi('VertSplit',       { fg = p.bg3 })
hi('WinSeparator',    { fg = p.bg3 })
hi('Visual',          { bg = p.bg2 })
hi('VisualNOS',       { bg = p.bg2 })
hi('WarningMsg',      { fg = p.yellow })
hi('Whitespace',      { fg = p.bg3 })
hi('WildMenu',        { fg = p.bg0, bg = p.blue })
hi('WinBar',          { fg = p.fg1, bg = p.bg0 })
hi('WinBarNC',        { fg = p.fg2, bg = p.bg0 })

-- ── Syntax ───────────────────────────────────────────────────────────────────
hi('Comment',         { fg = p.fg1, italic = true })
hi('Constant',        { fg = p.orange })
hi('String',          { fg = p.yellow })
hi('Character',       { fg = p.yellow })
hi('Number',          { fg = p.orange })
hi('Boolean',         { fg = p.orange, bold = true })
hi('Float',           { fg = p.orange })
hi('Identifier',      { fg = p.fg0 })
hi('Function',        { fg = p.green })
hi('Statement',       { fg = p.purple })
hi('Conditional',     { fg = p.purple })
hi('Repeat',          { fg = p.purple })
hi('Label',           { fg = p.purple })
hi('Operator',        { fg = p.teal })
hi('Keyword',         { fg = p.purple })
hi('Exception',       { fg = p.red })
hi('PreProc',         { fg = p.pink })
hi('Include',         { fg = p.pink })
hi('Define',          { fg = p.pink })
hi('Macro',           { fg = p.pink })
hi('PreCondit',       { fg = p.pink })
hi('Type',            { fg = p.blue })
hi('StorageClass',    { fg = p.purple })
hi('Structure',       { fg = p.blue })
hi('Typedef',         { fg = p.blue })
hi('Special',         { fg = p.teal })
hi('SpecialChar',     { fg = p.teal })
hi('Tag',             { fg = p.blue })
hi('Delimiter',       { fg = p.fg1 })
hi('SpecialComment',  { fg = p.teal, italic = true })
hi('Debug',           { fg = p.red })
hi('Underlined',      { underline = true })
hi('Ignore',          { fg = p.fg2 })
hi('Error',           { fg = p.red, bg = p.err_bg, bold = true })
hi('Todo',            { fg = p.yellow, bold = true })

-- ── Diagnostics ──────────────────────────────────────────────────────────────
hi('DiagnosticError',            { fg = p.red })
hi('DiagnosticWarn',             { fg = p.yellow })
hi('DiagnosticInfo',             { fg = p.blue })
hi('DiagnosticHint',             { fg = p.teal })
hi('DiagnosticOk',               { fg = p.green })
hi('DiagnosticUnderlineError',   { undercurl = true, sp = p.red })
hi('DiagnosticUnderlineWarn',    { undercurl = true, sp = p.yellow })
hi('DiagnosticUnderlineInfo',    { undercurl = true, sp = p.blue })
hi('DiagnosticUnderlineHint',    { undercurl = true, sp = p.teal })
hi('DiagnosticVirtualTextError', { fg = p.red,    bg = p.err_bg,  italic = true })
hi('DiagnosticVirtualTextWarn',  { fg = p.yellow, bg = p.warn_bg, italic = true })
hi('DiagnosticVirtualTextInfo',  { fg = p.blue,   bg = p.info_bg, italic = true })
hi('DiagnosticVirtualTextHint',  { fg = p.teal,   bg = p.hint_bg, italic = true })
hi('DiagnosticSignError',        { fg = p.red })
hi('DiagnosticSignWarn',         { fg = p.yellow })
hi('DiagnosticSignInfo',         { fg = p.blue })
hi('DiagnosticSignHint',         { fg = p.teal })

-- ── Diff ─────────────────────────────────────────────────────────────────────
hi('DiffAdd',    { fg = p.green,  bg = p.diff_add })
hi('DiffDelete', { fg = p.red,    bg = p.diff_del })
hi('DiffChange', { fg = p.blue,   bg = p.diff_chg })
hi('DiffText',   { fg = p.blue,   bg = p.diff_chg, bold = true })
hi('Added',      { fg = p.green })
hi('Removed',    { fg = p.red })
hi('Changed',    { fg = p.blue })

-- ── LSP ──────────────────────────────────────────────────────────────────────
hi('LspReferenceText',            { bg = p.bg2 })
hi('LspReferenceRead',            { bg = p.bg2 })
hi('LspReferenceWrite',           { bg = p.bg2, bold = true })
hi('LspSignatureActiveParameter', { fg = p.orange, bold = true })
hi('LspCodeLens',                 { fg = p.fg2, italic = true })

-- ── Treesitter ───────────────────────────────────────────────────────────────
local ts = {
  ['@comment']                   = { fg = p.fg1, italic = true },
  ['@comment.documentation']     = { fg = p.fg1, italic = true },
  ['@constant']                  = { fg = p.orange },
  ['@constant.builtin']          = { fg = p.orange, bold = true },
  ['@constant.macro']            = { fg = p.pink },
  ['@string']                    = { fg = p.yellow },
  ['@string.escape']             = { fg = p.teal },
  ['@string.special']            = { fg = p.teal },
  ['@number']                    = { fg = p.orange },
  ['@boolean']                   = { fg = p.orange, bold = true },
  ['@function']                  = { fg = p.green },
  ['@function.builtin']          = { fg = p.teal },
  ['@function.call']             = { fg = p.green },
  ['@function.macro']            = { fg = p.pink },
  ['@method']                    = { fg = p.green },
  ['@method.call']               = { fg = p.green },
  ['@constructor']               = { fg = p.blue },
  ['@parameter']                 = { fg = p.orange },
  ['@keyword']                   = { fg = p.purple },
  ['@keyword.function']          = { fg = p.purple },
  ['@keyword.operator']          = { fg = p.teal },
  ['@keyword.return']            = { fg = p.purple },
  ['@conditional']               = { fg = p.purple },
  ['@repeat']                    = { fg = p.purple },
  ['@include']                   = { fg = p.pink },
  ['@exception']                 = { fg = p.red },
  ['@operator']                  = { fg = p.teal },
  ['@punctuation.bracket']       = { fg = p.fg1 },
  ['@punctuation.delimiter']     = { fg = p.fg1 },
  ['@punctuation.special']       = { fg = p.teal },
  ['@type']                      = { fg = p.blue },
  ['@type.builtin']              = { fg = p.blue, italic = true },
  ['@type.qualifier']            = { fg = p.purple },
  ['@type.definition']           = { fg = p.blue },
  ['@field']                     = { fg = p.fg0 },
  ['@property']                  = { fg = p.fg0 },
  ['@variable']                  = { fg = p.fg0 },
  ['@variable.builtin']          = { fg = p.orange, bold = true },
  ['@namespace']                 = { fg = p.blue },
  ['@attribute']                 = { fg = p.pink },
  ['@tag']                       = { fg = p.blue },
  ['@tag.attribute']             = { fg = p.yellow },
  ['@tag.delimiter']             = { fg = p.fg2 },
  ['@text']                      = { fg = p.fg0 },
  ['@text.title']                = { fg = p.blue, bold = true },
  ['@text.emphasis']             = { italic = true },
  ['@text.strong']               = { bold = true },
  ['@text.underline']            = { underline = true },
  ['@text.uri']                  = { fg = p.teal, underline = true },
  ['@text.reference']            = { fg = p.blue },
  ['@text.todo']                 = { fg = p.yellow, bold = true },
  ['@text.warning']              = { fg = p.orange },
  ['@text.danger']               = { fg = p.red },
}
for group, opts in pairs(ts) do hi(group, opts) end

-- ── Git signs ────────────────────────────────────────────────────────────────
hi('GitSignsAdd',    { fg = p.green })
hi('GitSignsChange', { fg = p.blue })
hi('GitSignsDelete', { fg = p.red })

-- ── Telescope ────────────────────────────────────────────────────────────────
hi('TelescopeNormal',         { fg = p.fg0,  bg = p.bg1 })
hi('TelescopeBorder',         { fg = p.bg3,  bg = p.bg1 })
hi('TelescopePromptNormal',   { fg = p.fg0,  bg = p.bg2 })
hi('TelescopePromptBorder',   { fg = p.bg3,  bg = p.bg2 })
hi('TelescopePromptTitle',    { fg = p.bg0,  bg = p.blue, bold = true })
hi('TelescopeResultsTitle',   { fg = p.fg2,  bg = p.bg1 })
hi('TelescopePreviewTitle',   { fg = p.bg0,  bg = p.teal, bold = true })
hi('TelescopeSelection',      { fg = p.fg0,  bg = p.bg2 })
hi('TelescopeSelectionCaret', { fg = p.blue, bg = p.bg2 })
hi('TelescopeMatching',       { fg = p.orange, bold = true })

-- ── nvim-cmp ─────────────────────────────────────────────────────────────────
hi('CmpItemAbbr',           { fg = p.fg0 })
hi('CmpItemAbbrMatch',      { fg = p.orange, bold = true })
hi('CmpItemAbbrMatchFuzzy', { fg = p.orange })
hi('CmpItemMenu',           { fg = p.fg2, italic = true })
hi('CmpItemKindFunction',   { fg = p.green })
hi('CmpItemKindMethod',     { fg = p.green })
hi('CmpItemKindKeyword',    { fg = p.purple })
hi('CmpItemKindVariable',   { fg = p.fg0 })
hi('CmpItemKindConstant',   { fg = p.orange })
hi('CmpItemKindClass',      { fg = p.blue })
hi('CmpItemKindInterface',  { fg = p.blue })
hi('CmpItemKindModule',     { fg = p.blue })
hi('CmpItemKindText',       { fg = p.fg1 })
hi('CmpItemKindSnippet',    { fg = p.pink })

-- ── neo-tree ─────────────────────────────────────────────────────────────────
hi('NeoTreeNormal',           { fg = p.fg0, bg = p.bg1 })
hi('NeoTreeNormalNC',         { fg = p.fg1, bg = p.bg1 })
hi('NeoTreeDirectoryName',    { fg = p.blue })
hi('NeoTreeDirectoryIcon',    { fg = p.blue })
hi('NeoTreeRootName',         { fg = p.purple, bold = true })
hi('NeoTreeFileName',         { fg = p.fg0 })
hi('NeoTreeGitAdded',         { fg = p.green })
hi('NeoTreeGitModified',      { fg = p.blue })
hi('NeoTreeGitDeleted',       { fg = p.red })
hi('NeoTreeIndentMarker',     { fg = p.bg3 })
hi('NeoTreeExpander',         { fg = p.fg2 })

-- ── which-key ────────────────────────────────────────────────────────────────
hi('WhichKey',          { fg = p.teal })
hi('WhichKeyGroup',     { fg = p.blue })
hi('WhichKeyDesc',      { fg = p.fg0 })
hi('WhichKeySeparator', { fg = p.fg2 })
hi('WhichKeyFloat',     { bg = p.bg1 })
hi('WhichKeyBorder',    { fg = p.bg3, bg = p.bg1 })

-- ── indent-blankline ─────────────────────────────────────────────────────────
hi('IblIndent', { fg = p.bg2 })
hi('IblScope',  { fg = p.bg3 })
