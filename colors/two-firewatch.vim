" Name:    Firewatch duotone vim colorscheme
" Author:  Ramzi Akremi
" License: MIT
" Version: 1.0.0

" Global setup =============================================================={{{

hi clear
syntax reset

" To switch properly between light and dark.
let g:colors_name = 'two-firewatch'

" Default options.
if !exists('g:two_firewatch_italics')
  let g:two_firewatch_italics = 0
endif

" Converting Colors. {{{
" https://github.com/norcalli/nvim-colorizer.lua/blob/master/lua/colorizer.lua#L145

function! HueToRGB(p, q, t)
  let l:t = a:t

  if (l:t < 0)
    let l:t = l:t + 1
  endif
  if (l:t > 1)
    let l:t = l:t - 1
  endif
  if (l:t < 1.0 / 6)
    return a:p + (a:q - a:p) * 6 * l:t
  endif
  if (l:t < 1.0 / 2)
    return a:q
  endif
  if (l:t < 2.0 / 3)
    return a:p + (a:q - a:p) * (2.0 / 3 - l:t) * 6
  endif
  return a:p
endfunction

function! HSLtoRGB(h, s, l)
	if (a:h > 1 || a:s > 1 || a:l > 1)
    return [0, 0, 0]
  endif
	if (a:s == 0)
		let l:r = a:l * 255
		return [l:r, l:r, l:r]
	endif

  let l:q = 0

	if (a:l < 0.5)
		let l:q = a:l * (1 + a:s)
	else
		let l:q = a:l + a:s - a:l * a:s
	endif
  let l:p = 2 * a:l - l:q
	return [
        \ 255 * HueToRGB(l:p, l:q, a:h + 1.0 / 3),
        \ 255 * HueToRGB(l:p, l:q, a:h),
        \ 255 * HueToRGB(l:p, l:q, a:h - 1.0 / 3)]
endfunction

function! Dec2hex(x)
  let l:d = {
    \ 10: 'a',
    \ 11: 'b',
    \ 12: 'c',
    \ 13: 'd',
    \ 14: 'e',
    \ 15: 'f'
  \ }

  let l:d1 = float2nr(a:x) / 16
  let l:d2 = float2nr(a:x) % 16

  let l:d1 = get(l:d, l:d1, l:d1)
  let l:d2 = get(l:d, l:d2, l:d2)

  return l:d1 . l:d2
endfunction

function ParseHsl(s)
  let l:_ = a:s
  let l:_ = substitute(l:_, 'hsl(', '[', '')
  let l:_ = substitute(l:_, ')',    ']', '')
  let l:_ = substitute(l:_, '%',    '',  'g')
  let l:_ = eval(l:_)
  let [l:h, l:s, l:l] = [
    \ l:_[0] * 1.0 / 360,
    \ l:_[1] * 1.0 / 100,
    \ l:_[2] * 1.0 / 100]
  return [l:h, l:s, l:l]
endfunction

function! Hsl(cssfn)
  let [l:h, l:s, l:l] = ParseHsl(a:cssfn)
  let [d1, d2, d3] = HSLtoRGB(l:h, l:s, l:l)
  return Dec2hex(d1) . Dec2hex(d2) . Dec2hex(d3)
endfunction

" hsl(0, 70%, 40%);
"}}} parse colors

" sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
  let l:attr = a:attr
  if g:two_firewatch_italics == 0 && l:attr ==? 'italic'
    let l:attr = 'none'
  endif

  if a:fg !=? ''
    exec 'hi ' . a:group . ' guifg=' . a:fg
  endif
  if a:bg !=? ''
    exec 'hi ' . a:group . ' guibg=' . a:bg
  endif
  if a:attr !=? ''
    exec 'hi ' . a:group . ' gui=' . l:attr
  endif
endfun

"}}}

  " Color definition --------------------------------------------------------{{{

  " Diff colors.
  let s:color_diff_change            = '#cdcdfd'
  let s:color_diff_delete            = '#ffcddc'
  let s:color_diff_add               = '#c9e6c9'
  let s:color_diff_text              = '#b6f2b6'

  " @see https://www.google.com/search?q=color+picker for conversion rgb->hsv
  if &background ==? 'light'
    " First color.
    let s:uno_1 = '#332405' " 40°, 90%, 20%
    let s:uno_2 = '#8c6923' " 40°, 75%, 55%
    let s:uno_3 = '#b29762' " 40°, 45%, 70%
    let s:uno_4 = '#998f7a' " 40°, 20%, 60%

    " Second color.
    let s:duo_1 = '#0f5499' " 210°, 90%, 50%
    let s:duo_2 = '#528fcc' " 210°, 60%, 80%
    let s:duo_3 = '#919599' " 210°,  5%, 60%

    "
    let s:syntax_fg               = s:uno_2
    let s:syntax_bg               = '#faf8f5' " 36°, 2%, 98%

    let s:syntax_error            = '#cc7a7a' " 0°, 40%, 80%

    let s:syntax_accent           = s:uno_2
    let s:syntax_selection        = '#e6decf' " 40°, 10%, 90%
    let s:syntax_signcolumn       = '#ebe7df' " 40°, 5%, 92%
    let s:syntax_fold_bg          = '#ccc5b8' " 40°, 10%, 80%
    let s:syntax_cursor_line      = '#f3efe7' " 40°, 5%, 95%
  else " Dark.
    " First color.
    let s:uno_1 = '#d6e9ff' " 212°, 16%, 100%
    let s:uno_2 = '#abb2bf' " 219°, 10%, 75%
    let s:uno_3 = '#6e88a6' " 212°, 34%, 65%
    let s:uno_4 = '#7a8799' " 215°, 20%, 70

    " Second color.
    let s:duo_1 = '#c8ae9d' " 24°, 22%, 78%
    let s:duo_2 = '#e06c75' " 355°, 52%, 88%
    let s:duo_3 = '#dd672c' " 20°, 80%, 87%

    let s:syntax_fg               = s:uno_2
    let s:syntax_bg               = '#23272e' " 218°, 24%, 18%

    "
    let s:syntax_error            = '#cc3d3d'

    let s:syntax_accent           = '#56b6c2'
    let s:syntax_selection        = '#3e4452'
    let s:syntax_signcolumn       = '#55606d' " 213°, 22%, 43%
    let s:syntax_fold_bg          = '#5c6370'
    let s:syntax_cursor_line      = '#2c323c'
  endif

  " neovim :terminal colors {{{
  let g:terminal_color_0  = ""
  let g:terminal_color_8  = ""
  let g:terminal_color_1  = "#e06c75"
  let g:terminal_color_9  = "#e06c75"
  let g:terminal_color_2  = "#98c379"
  let g:terminal_color_10 = "#98c379"
  let g:terminal_color_3  = "#e5c07b"
  let g:terminal_color_11 = "#e5c07b"
  let g:terminal_color_4  = "#61afef"
  let g:terminal_color_12 = "#61afef"
  let g:terminal_color_5  = "#c678dd"
  let g:terminal_color_13 = "#c678dd"
  let g:terminal_color_6  = "#56b6c2"
  let g:terminal_color_14 = "#56b6c2"
  let g:terminal_color_7  = ""
  let g:terminal_color_15 = ""

  if &background ==? 'light'
    let g:terminal_color_0  = "#282c34"
    let g:terminal_color_8  = "#4d4d4d"
    let g:terminal_color_7  = "#737780"
    let g:terminal_color_15 = "#a1a7b3"
  else " Dark
    let g:terminal_color_0  = "#000000"
    let g:terminal_color_8  = "#4d4d4d"
    let g:terminal_color_7  = "#737780"
    let g:terminal_color_15 = "#a1a7b3"
  endif
  " }}}

"}}} color definition

  " Vim editor color --------------------------------------------------------{{{
  call <sid>X('bold',         '',               '',                   'bold')
  call <sid>X('ColorColumn',  '',               s:syntax_cursor_line, '')
  call <sid>X('Conceal',      '',               '',                   '')
  call <sid>X('Cursor',       s:syntax_bg,      s:syntax_accent,      '')
  call <sid>X('CursorIM',     '',               '',                   '')
  call <sid>X('CursorColumn', '',               s:syntax_cursor_line, '')
  call <sid>X('CursorLine',   '',               s:syntax_cursor_line, '')
  call <sid>X('Directory',    s:uno_1,          '',                   '')
  call <sid>X('ErrorMsg',     s:syntax_error,   s:syntax_bg,          'none')
  call <sid>X('VertSplit',    s:syntax_fold_bg, '',                   'none')
  call <sid>X('Folded',       s:syntax_bg,      s:syntax_fold_bg,     '')
  call <sid>X('FoldColumn',   s:uno_3,          s:syntax_cursor_line, '')
  call <sid>X('IncSearch',    s:syntax_bg,      s:uno_4,              '')
  call <sid>X('LineNr',       s:syntax_fold_bg, '',                   '')
  call <sid>X('CursorLineNr', s:uno_2,          '',                   'none')
  call <sid>X('MatchParen',   s:syntax_accent,  s:syntax_bg,          'bold')
  call <sid>X('Italic',       '',               '',                   'italic')
  call <sid>X('ModeMsg',      s:color_diff_add, '',                   '')
  call <sid>X('MoreMsg',      s:syntax_fg,      '',                   '')
  call <sid>X('NonText',      s:syntax_signcolumn, '',                '')
  call <sid>X('EndOfBuffer',  s:syntax_bg,      '',                   '')
  call <sid>X('PMenu',        '',               s:syntax_selection,   '')
  call <sid>X('PMenuSel',     '',               s:syntax_bg,          '')
  call <sid>X('PMenuSbar',    '',               s:syntax_bg,          '')
  call <sid>X('PMenuThumb',   '',               s:uno_1,              '')
  call <sid>X('Question',     s:syntax_accent,  '',                   '')
  call <sid>X('Search',       s:syntax_bg,      s:uno_4,              '')
  call <sid>X('SpecialKey',   s:syntax_fold_bg, '',                   '')
  call <sid>X('StatusLine',   s:syntax_fg,      s:syntax_cursor_line, 'none')
  call <sid>X('StatusLineNC', s:uno_4,          '',                   '')
  call <sid>X('TabLine',      s:uno_4,          '',                   '')
  call <sid>X('TabLineFill',  '',               '',                   'none')
  call <sid>X('TabLineSel',   s:syntax_fg,      '',                   '')
  call <sid>X('Title',        s:duo_2,          '',                   'bold')
  call <sid>X('Visual',       '',               s:syntax_selection,   '')
  call <sid>X('VisualNOS',    '',               s:syntax_selection,   '')
  call <sid>X('WarningMsg',   s:syntax_accent,  '',                   '')
  call <sid>X('TooLong',      s:syntax_accent,  '',                   '')
  call <sid>X('WildMenu',     s:syntax_fg,      s:uno_4,              '')
  call <sid>X('Normal',       s:syntax_fg,      s:syntax_bg,          '')
  call <sid>X('SignColumn',   '',               s:syntax_signcolumn,  '')
  call <sid>X('Special',      s:duo_2,          '',                   '')
  " }}}

  " Standard syntax highlighting --------------------------------------------{{{
  call <sid>X('Comment',        s:uno_4,                '',          'italic')
  call <sid>X('Constant',       s:duo_2,                '',          '')
  call <sid>X('String',         s:duo_1,                '',          '')
  call <sid>X('Character',      s:duo_2,                '',          '')
  call <sid>X('Number',         s:duo_2,                '',          '')
  call <sid>X('Boolean',        s:duo_2,                '',          '')
  call <sid>X('Float',          s:duo_2,                '',          '')
  call <sid>X('Identifier',     s:uno_3,                '',          'none')
  call <sid>X('Function',       s:uno_2,                '',          '')
  call <sid>X('Statement',      s:duo_1,                '',          'none')
  call <sid>X('Conditional',    s:syntax_accent,        '',          '')
  call <sid>X('Repeat',         s:duo_2,                '',          '')
  call <sid>X('Label',          s:uno_1,                '',          '')
  call <sid>X('Operator',       s:syntax_accent,        '',          'none')
  call <sid>X('Keyword',        s:uno_1,                '',          '')
  call <sid>X('Exception',      s:uno_1,                '',          '')
  call <sid>X('PreProc',        s:uno_1,                '',          '')
  "call <sid>X('Include',        s:duo_2,                '',          '')
  "call <sid>X('Define',         s:duo_2,                '',          'none')
  "call <sid>X('Macro',          s:uno_3,                '',          '')
  "call <sid>X('PreCondit',      'ff0000',               '',          '')
  call <sid>X('Type',           s:duo_1,                '',          'none')
  call <sid>X('StorageClass',   s:duo_2,                '',          '')
  call <sid>X('Structure',      s:uno_1,                '',          '')
  call <sid>X('Typedef',        s:uno_1,                '',          '')
  call <sid>X('Special',        s:uno_3,                '',          '')
  call <sid>X('SpecialChar',    '',                     '',          '')
  call <sid>X('Tag',            '',                     '',          '')
  call <sid>X('Delimiter',      s:uno_4,                '',          '')
  call <sid>X('SpecialComment', '',                     '',          '')
  call <sid>X('Debug',          '',                     '',          '')
  call <sid>X('Underlined',     s:duo_1,                '',          'underline')
  call <sid>X('Ignore',         '',                     '',          '')
  call <sid>X('Error',          s:syntax_error,         s:syntax_bg, 'bold')
  call <sid>X('Todo',           s:duo_1,                s:syntax_bg, '')
  " }}}

  " Asciidoc highlighting ---------------------------------------------------{{{
  call <sid>X('asciidocListingBlock',   s:uno_2,  '', '')
  " }}}

  " Cucumber highlighting ---------------------------------------------------{{{
  call <sid>X('cucumberGiven',           s:duo_2,         '', '')
  call <sid>X('cucumberWhen',            s:duo_2,         '', '')
  call <sid>X('cucumberWhenAnd',         s:duo_2,         '', '')
  call <sid>X('cucumberThen',            s:duo_2,         '', '')
  call <sid>X('cucumberThenAnd',         s:duo_2,         '', '')
  call <sid>X('cucumberUnparsed',        s:duo_1,         '', '')
  call <sid>X('cucumberFeature',         s:syntax_accent, '', 'bold')
  call <sid>X('cucumberBackground',      s:duo_2,         '', 'bold')
  call <sid>X('cucumberScenario',        s:duo_2,         '', 'bold')
  call <sid>X('cucumberScenarioOutline', s:duo_2,         '', 'bold')
  call <sid>X('cucumberTags',            s:uno_4,         '', 'bold')
  call <sid>X('cucumberDelimiter',       s:uno_4,         '', 'bold')
  " }}}

  " Diff highlighting -------------------------------------------------------{{{
  call <sid>X('DiffAdd',     '000000', s:color_diff_add,    '')
  call <sid>X('DiffChange',  '000000', s:color_diff_change, '')
  call <sid>X('DiffDelete',  '000000', s:color_diff_delete, '')
  call <sid>X('DiffText',    '000000', s:color_diff_text,   '')
  " }}}

  " C/C++ and other languages like that -------------------------------------{{{
  "call <sid>X('cCustomParen',           s:uno_4,         '', '')
  " }}}

  " CSS/Sass highlighting ---------------------------------------------------{{{
  call <sid>X('cssAttrComma',           s:duo_3,         '', '')
  call <sid>X('cssAttributeSelector',   s:duo_2,         '', '')
  call <sid>X('cssBraces',              s:uno_4,         '', '')
  call <sid>X('cssClassName',           s:uno_1,         '', '')
  call <sid>X('cssClassNameDot',        s:uno_1,         '', '')
  call <sid>X('cssDefinition',          s:duo_3,         '', '')
  call <sid>X('cssFlexibleBoxAttr',     s:duo_1,         '', '')
  call <sid>X('cssBorderAttr',          s:duo_1,         '', '')
  call <sid>X('cssPositioningAttr',     s:duo_1,         '', '')
  call <sid>X('cssTransitionAttr',      s:duo_1,         '', '')
  call <sid>X('cssCommonAttr',          s:duo_1,         '', '')
  call <sid>X('cssBoxAttr',             s:duo_1,         '', '')
  call <sid>X('cssFontAttr',            s:duo_1,         '', '')
  call <sid>X('cssTextAttr',            s:duo_1,         '', '')
  call <sid>X('cssFontDescriptor',      s:uno_1,         '', '')
  call <sid>X('cssFunctionName',        s:uno_3,         '', '')
  call <sid>X('cssIdentifier',          s:duo_1,         '', '')
  call <sid>X('cssImportant',           s:duo_1,         '', '')
  call <sid>X('cssUnitDecorators',      s:duo_2,         '', '')
  call <sid>X('cssInclude',             s:uno_1,         '', '')
  call <sid>X('cssIncludeKeyword',      s:duo_3,         '', '')
  call <sid>X('cssMediaType',           s:uno_1,         '', '')
  call <sid>X('cssProp',                s:uno_3,         '', '')
  call <sid>X('cssPseudoClassId',       s:uno_1,         '', '')
  call <sid>X('cssSelectorOp',          s:duo_3,         '', '')
  call <sid>X('cssSelectorOp2',         s:duo_3,         '', '')
  call <sid>X('cssStringQ',             s:duo_1,         '', '')
  call <sid>X('cssStringQQ',            s:duo_1,         '', '')
  call <sid>X('cssTagName',             s:uno_1,         '', '')
  call <sid>X('cssClassNameDot',        s:uno_4,         '', '')
  call <sid>X('cssValueNumber',         s:duo_1,         '', '')

  call <sid>X('sassAmpersand',          s:syntax_accent, '', '')
  call <sid>X('sassClass',              s:uno_1,         '', '')
  call <sid>X('sassControl',            s:duo_3,         '', '')
  call <sid>X('sassExtend',             s:duo_3,         '', '')
  call <sid>X('sassFor',                s:uno_1,         '', '')
  call <sid>X('sassProperty',           s:uno_3,         '', '')
  call <sid>X('sassFunction',           s:duo_1,         '', '')
  call <sid>X('sassId',                 s:duo_2,         '', '')
  call <sid>X('sassInclude',            s:uno_1,         '', '')
  call <sid>X('sassMedia',              s:duo_3,         '', '')
  call <sid>X('sassMediaOperators',     s:uno_1,         '', '')
  call <sid>X('sassMixin',              s:duo_3,         '', '')
  call <sid>X('sassMixinName',          s:duo_2,         '', '')
  call <sid>X('sassMixing',             s:duo_3,         '', '')
  call <sid>X('sassVariable',           s:uno_2,         '', '')
  call <sid>X('sassVariableAssignment', s:uno_4,         '', '')
  " }}}

  " Elixir highlighting------------------------------------------------------{{{
  "call <sid>X('elixirAtom',              s:syntax_accent, '', '')
  "call <sid>X('elixirAlias',             s:duo_1,         '', '')
  call <sid>X('elixirBlock',             s:uno_3,         '', '')
  "call <sid>X('elixirBlockDefinition',   s:duo_2,         '', '')
  "call <sid>X('elixirInclude',           s:duo_2,         '', '')
  call <sid>X('elixirId',                s:uno_2,         '', '')
  call <sid>X('elixirModuleDeclaration', s:uno_1,         '', '')
  "call <sid>X('elixirModuleDefine',      s:duo_2,         '', '')
  "call <sid>X('elixirOperator',          s:uno_3,         '', '')
  "call <sid>X('elixirSigil',             s:uno_4,         '', '')
  "call <sid>X('elixirVariable',          s:duo_2,         '', '')
  " }}}

  " Go highlighting ---------------------------------------------------------{{{
  call <sid>X('goDeclaration',         s:duo_3, '', '')
  " }}}

  " Git and git related plugins highlighting --------------------------------{{{
  call <sid>X('gitcommitComment',       s:uno_4,         '', '')
  call <sid>X('gitcommitUnmerged',      s:duo_2,         '', '')
  call <sid>X('gitcommitOnBranch',      '',              '', '')
  call <sid>X('gitcommitBranch',        s:duo_3,         '', '')
  call <sid>X('gitcommitDiscardedType', s:syntax_accent, '', '')
  call <sid>X('gitcommitSelectedType',  s:duo_2,         '', '')
  call <sid>X('gitcommitHeader',        '',              '', '')
  call <sid>X('gitcommitUntrackedFile', s:duo_2,         '', '')
  call <sid>X('gitcommitDiscardedFile', s:syntax_accent, '', '')
  call <sid>X('gitcommitSelectedFile',  s:duo_2,         '', '')
  call <sid>X('gitcommitUnmergedFile',  s:uno_1,         '', '')
  call <sid>X('gitcommitFile',          '',              '', '')
  hi link gitcommitNoBranch       gitcommitBranch
  hi link gitcommitUntracked      gitcommitComment
  hi link gitcommitDiscarded      gitcommitComment
  hi link gitcommitSelected       gitcommitComment
  hi link gitcommitDiscardedArrow gitcommitDiscardedFile
  hi link gitcommitSelectedArrow  gitcommitSelectedFile
  hi link gitcommitUnmergedArrow  gitcommitUnmergedFile

  call <sid>X('SignifySignAdd',    s:duo_2,         '', '')
  call <sid>X('SignifySignChange', s:uno_1,         '', '')
  call <sid>X('SignifySignDelete', s:syntax_accent, '', '')
  hi link GitGutterAdd    SignifySignAdd
  hi link GitGutterChange SignifySignChange
  hi link GitGutterDelete SignifySignDelete
  call <sid>X('diffAdded',   s:duo_2,         '', '')
  call <sid>X('diffRemoved', s:syntax_accent, '', '')
  " }}}

  " HTML highlighting -------------------------------------------------------{{{
  call <sid>X('htmlArg',            s:uno_2, '', '')
  call <sid>X('htmlTagName',        s:uno_1, '', '')
  call <sid>X('htmlSpecialTagName', s:uno_1, '', '')
  call <sid>X('htmlTag',            s:uno_3, '', '')

  call <sid>X('liquidDelimiter',    s:uno_4, '', '')
  call <sid>X('liquidKeyword',      s:uno_3, '', '')
  " }}}

  " JavaScript highlighting -------------------------------------------------{{{
  call <sid>X('coffeeString',           s:duo_2,         '', '')

  call <sid>X('javaScriptBraces',       s:uno_3,         '', '')
  call <sid>X('javaScriptFunction',     s:duo_3,         '', '')
  call <sid>X('javaScriptIdentifier',   s:duo_3,         '', '')
  call <sid>X('javaScriptNull',         s:uno_1,         '', '')
  call <sid>X('javaScriptNumber',       s:uno_1,         '', '')
  call <sid>X('javaScriptRequire',      s:duo_2,         '', '')
  call <sid>X('javaScriptReserved',     s:duo_3,         '', '')
  " https://github.com/pangloss/vim-javascript
  call <sid>X('jsArrowFunction',        s:duo_3,         '', '')
  call <sid>X('jsClassKeywords',        s:duo_3,         '', '')
  call <sid>X('jsDocParam',             s:duo_2,         '', '')
  call <sid>X('jsDocTags',              s:duo_3,         '', '')
  call <sid>X('jsFuncCall',             s:uno_1,         '', '')
  call <sid>X('jsFunction',             s:duo_3,         '', '')
  call <sid>X('jsGlobalObjects',        s:uno_1,         '', '')
  call <sid>X('jsModuleWords',          s:duo_3,         '', '')
  call <sid>X('jsModules',              s:duo_3,         '', '')
  call <sid>X('jsNoise',                s:uno_3,         '', '')
  call <sid>X('jsNull',                 s:uno_1,         '', '')
  call <sid>X('jsOperator',             s:duo_2,         '', '')
  call <sid>X('jsObjectBraces',         s:uno_3,         '', '')
  call <sid>X('jsBrackets',             s:uno_3,         '', '')
  call <sid>X('jsParens',               s:uno_3,         '', '')
  call <sid>X('jsStorageClass',         s:duo_1,         '', '')
  call <sid>X('jsTemplateBraces',       s:syntax_accent, '', '')
  call <sid>X('jsTemplateVar',          s:duo_2,         '', '')
  call <sid>X('jsThis',                 s:syntax_accent, '', '')
  call <sid>X('jsUndefined',            s:uno_1,         '', '')
  " https://github.com/othree/yajs.vim
  call <sid>X('javascriptArrowFunc',    s:duo_3,         '', '')
  call <sid>X('javascriptClassExtends', s:duo_3,         '', '')
  call <sid>X('javascriptClassKeyword', s:duo_3,         '', '')
  call <sid>X('javascriptDocNotation',  s:duo_3,         '', '')
  call <sid>X('javascriptDocParamName', s:duo_2,         '', '')
  call <sid>X('javascriptDocTags',      s:duo_3,         '', '')
  call <sid>X('javascriptEndColons',    s:uno_3,         '', '')
  call <sid>X('javascriptExport',       s:duo_3,         '', '')
  call <sid>X('javascriptFuncArg',      s:uno_1,         '', '')
  call <sid>X('javascriptFuncKeyword',  s:duo_3,         '', '')
  call <sid>X('javascriptIdentifier',   s:syntax_accent, '', '')
  call <sid>X('javascriptImport',       s:duo_3,         '', '')
  call <sid>X('javascriptObjectLabel',  s:uno_1,         '', '')
  call <sid>X('javascriptOpSymbol',     s:duo_2,         '', '')
  call <sid>X('javascriptOpSymbols',    s:duo_2,         '', '')
  call <sid>X('javascriptPropertyName', s:duo_2,         '', '')
  call <sid>X('javascriptTemplateSB',   s:syntax_accent, '', '')
  call <sid>X('javascriptVariable',     s:duo_3,         '', '')
  " }}}

  " JSON highlighting -------------------------------------------------------{{{
  call <sid>X('jsonCommentError',      s:uno_1,         '', ''        )
  call <sid>X('jsonKeyword',           s:duo_2,         '', ''        )
  call <sid>X('jsonQuote',             s:uno_3,         '', ''        )
  call <sid>X('jsonMissingCommaError', s:syntax_accent, '', 'reverse' )
  call <sid>X('jsonNoQuotesError',     s:syntax_accent, '', 'reverse' )
  call <sid>X('jsonNumError',          s:syntax_accent, '', 'reverse' )
  call <sid>X('jsonString',            s:duo_1,         '', ''        )
  call <sid>X('jsonStringSQError',     s:syntax_accent, '', 'reverse' )
  call <sid>X('jsonSemicolonError',    s:syntax_accent, '', 'reverse' )
  " }}}

  " Markdown highlighting ---------------------------------------------------{{{
  call <sid>X('markdownUrl',              s:duo_3, '', '')
  call <sid>X('markdownCode',             s:duo_1, '', '')
  call <sid>X('markdownHeadingDelimiter', s:duo_3, '', '')
  call <sid>X('markdownListMarker',       s:duo_3, '', '')

  call <sid>X('mkdCode',                  s:duo_1, '', '')
  call <sid>X('mkdDelimiter',             s:uno_3, '', '')
  call <sid>X('mkdLink',                  s:duo_1, '', '')
  call <sid>X('mkdLinkDef',               s:duo_1, '', '')
  call <sid>X('mkdLinkDefTarget',         s:duo_1, '', 'underline')
  call <sid>X('mkdURL',                   s:duo_1, '', 'underline')

  call <sid>X('htmlBold',                 s:uno_2, '', 'bold')
  call <sid>X('htmlItalic',               s:uno_2, '', 'italic')
  " }}}

  " NERDTree highlighting ---------------------------------------------------{{{
  call <sid>X('NERDTreeExecFile',      s:duo_1, '', '')
  " }}}

  " Ruby highlighting -------------------------------------------------------{{{
  call <sid>X('rubyBlock',                     s:uno_2,         '', '')
  call <sid>X('rubyBlockParameter',            s:uno_2,         '', '')
  call <sid>X('rubyBlockParameterList',        s:uno_3,         '', '')
  call <sid>X('rubyCapitalizedMethod',         s:duo_2,         '', '')
  call <sid>X('rubyClass',                     s:duo_2,         '', '')
  call <sid>X('rubyConstant',                  s:uno_3,         '', '')
  call <sid>X('rubyControl',                   s:duo_2,         '', '')
  call <sid>X('rubyConditionalModifier',       s:syntax_accent, '', '')
  call <sid>X('rubyCurlyBlockDelimiter',       s:uno_4,         '', '')
  call <sid>X('rubyDefine',                    s:duo_2,         '', '')
  call <sid>X('rubyEscape',                    s:syntax_accent, '', '')
  call <sid>X('rubyFunction',                  s:uno_1,         '', '')
  call <sid>X('rubyGlobalVariable',            s:syntax_accent, '', '')
  call <sid>X('rubyInclude',                   s:duo_2,         '', '')
  call <sid>X('rubyIncluderubyGlobalVariable', s:syntax_accent, '', '')
  call <sid>X('rubyInstanceVariable',          s:syntax_accent, '', '')
  call <sid>X('rubyInterpolation',             s:duo_2,         '', '')
  call <sid>X('rubyInterpolationDelimiter',    s:uno_4,         '', '')
  call <sid>X('rubyModule',                    s:duo_2,         '', '')
  call <sid>X('rubyRegexp',                    s:duo_1,         '', '')
  call <sid>X('rubyRegexpDelimiter',           s:uno_4,         '', '')
  call <sid>X('rubyStringDelimiter',           s:duo_3,         '', '')
  call <sid>X('rubySymbol',                    s:duo_1,         '', '')
  " }}}

  " Spelling highlighting ---------------------------------------------------{{{
  call <sid>X('SpellBad',     '', s:syntax_bg, 'undercurl')
  call <sid>X('SpellLocal',   '', s:syntax_bg, 'undercurl')
  call <sid>X('SpellCap',     '', s:syntax_bg, 'undercurl')
  call <sid>X('SpellRare',    '', s:syntax_bg, 'undercurl')
  " }}}

  " Vim highlighting --------------------------------------------------------{{{
  "call <sid>X('vimCommentTitle', s:uno_4, '', 'bold')
  call <sid>X('vimCommand',      s:uno_1, '', '')
  call <sid>X('vimVar',          s:duo_2, '', '')
  call <sid>X('vimEnvVar',       s:duo_3, '', '')

  " Vim Help highlights
  call <sid>X('helpHyperTextJump', s:duo_1, '', '')
  call <sid>X('helpSpecial',       s:duo_2, '', '')

  " }}}

  " XML highlighting --------------------------------------------------------{{{
  call <sid>X('xmlAttrib',  s:uno_1,         '', '')
  call <sid>X('xmlEndTag',  s:syntax_accent, '', '')
  call <sid>X('xmlTag',     s:syntax_accent, '', '')
  call <sid>X('xmlTagName', s:syntax_accent, '', '')
  " }}}

  " YAML highlighting -------------------------------------------------------{{{
  call <sid>X('yamlKey',         s:duo_2, '', '')
  call <sid>X('yamlOperator',    s:uno_4, '', '')

  call <sid>X('liquidDelimiter', s:uno_4, '', '')
  call <sid>X('liquidKeyword',   s:uno_3, '', '')
  " }}}

" Delete functions =========================================================={{{
  delf <SID>X
"}}}


" vim: set fdl=0 fdm=marker:
