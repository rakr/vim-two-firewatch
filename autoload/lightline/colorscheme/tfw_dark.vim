let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:gray_light = [ '#C5D4DD', 255 ]
let s:gray_darker = [ '#899BA6', 255 ]
let s:gray_dark = [ '#363d4b', 255 ]
let s:light_fg = [ '#f2ebe6', 255 ]
let s:normal_bg = [ '#83AFE5', 255 ]
let s:insert_bg = [ '#A8CE93', 255 ]
let s:visual_bg = [ '#7FC1CA', 255 ]
let s:replace_bg = [ '#e06c75', 255 ]
let s:warning_bg = [ '#e5c07b', 255 ]
let s:error_bg = [ '#e06c75', 255 ]

"{{{
let s:normal_l1_fg = s:gray_dark
let s:normal_l1_bg = s:normal_bg
let s:normal_l2_fg = s:light_fg
let s:normal_l2_bg = s:gray_darker
let s:normal_r1_fg = s:gray_dark
let s:normal_r1_bg = s:gray_light
let s:normal_r2_fg = s:light_fg
let s:normal_r2_bg = s:gray_darker

let s:insert_l1_fg = s:gray_dark
let s:insert_l1_bg = s:insert_bg
let s:insert_l2_fg = s:light_fg
let s:insert_l2_bg = s:gray_darker
let s:insert_r1_fg = s:gray_dark
let s:insert_r1_bg = s:gray_light
let s:insert_r2_fg = s:light_fg
let s:insert_r2_bg = s:gray_darker

let s:visual_l1_fg = s:gray_dark
let s:visual_l1_bg = s:visual_bg
let s:visual_l2_fg = s:light_fg
let s:visual_l2_bg = s:gray_darker
let s:visual_r1_fg = s:gray_dark
let s:visual_r1_bg = s:gray_light
let s:visual_r2_fg = s:light_fg
let s:visual_r2_bg = s:gray_darker

let s:inactive_l1_fg = s:gray_dark
let s:inactive_l1_bg = s:gray_dark
let s:inactive_l2_fg = s:light_fg
let s:inactive_l2_bg = s:gray_darker
let s:inactive_r1_fg = s:gray_dark
let s:inactive_r1_bg = s:gray_light
let s:inactive_r2_fg = s:light_fg
let s:inactive_r2_bg = s:gray_darker

let s:tab_l_fg = s:gray_dark
let s:tab_l_bg = s:gray_light
let s:tab_sel_fg = s:light_fg
let s:tab_sel_bg = s:gray_darker

let s:replace_l1_fg = s:light_fg
let s:replace_l1_bg = s:replace_bg
let s:replace_l2_fg = s:light_fg
let s:replace_l2_bg = s:gray_darker

let s:middle_fg = s:light_fg
let s:middle_bg = s:gray_dark

let s:warningfg = s:light_fg
let s:warningbg = s:warning_bg
let s:errorfg = s:light_fg
let s:errorbg = s:error_bg
"}}}

"{{{
let s:p.normal.left = [ [ s:normal_l1_fg, s:normal_l1_bg ], [ s:normal_l2_fg, s:normal_l2_bg ] ]
let s:p.normal.middle = [ [ s:middle_fg, s:middle_bg ] ]
let s:p.normal.right = [ [ s:normal_r1_fg, s:normal_r1_bg ], [ s:normal_r2_fg, s:normal_r2_bg ] ]

let s:p.insert.left = [ [ s:insert_l1_fg, s:insert_l1_bg ], [ s:insert_l2_fg, s:insert_l2_bg ] ]
let s:p.insert.middle = [ [ s:middle_fg, s:middle_bg ] ]
let s:p.insert.right = [ [ s:insert_r1_fg, s:insert_r1_bg ], [ s:insert_r2_fg, s:insert_r2_bg ] ]

let s:p.visual.left = [ [ s:visual_l1_fg, s:visual_l1_bg ], [ s:visual_l2_fg, s:visual_l2_bg ] ]
let s:p.visual.middle = [ [ s:middle_fg, s:middle_bg ] ]
let s:p.visual.right = [ [ s:visual_r1_fg, s:visual_r1_bg ], [ s:visual_r2_fg, s:visual_r2_bg ] ]

let s:p.inactive.left = [ [ s:inactive_l1_fg, s:inactive_l1_bg ], [ s:inactive_l2_fg, s:inactive_l2_bg ] ]
let s:p.inactive.middle = [ [ s:middle_fg, s:middle_bg ] ]
let s:p.inactive.right = [ [ s:inactive_r1_fg, s:inactive_r1_bg ], [ s:inactive_r2_fg, s:inactive_r2_bg ] ]

let s:p.tabline.left = [ [ s:tab_l_fg, s:tab_l_bg] ]
let s:p.tabline.tabsel = [ [ s:tab_sel_fg, s:tab_sel_bg ] ]
let s:p.tabline.middle = [ [ s:middle_fg, s:middle_bg] ]
let s:p.tabline.right = [ [ s:normal_r1_fg, s:normal_r1_bg ] ]

let s:p.normal.error = [ [ s:errorfg, s:errorbg ] ]
let s:p.normal.warning = [ [ s:warningfg, s:warningbg ] ]

let s:p.replace.left = [ [ s:replace_l1_fg, s:replace_l1_bg ], [ s:replace_l2_fg, s:replace_l2_bg ] ]
"}}}

let g:lightline#colorscheme#tfw_dark#palette = lightline#colorscheme#flatten(s:p)
