let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:base0 = [ '#6e6b5e', 255 ]
let s:base1 = [ '#999580', 255 ]
let s:base2 = [ '#e8e4cf', 255 ]
let s:light_fg = [ '#e3ecff', 255 ]
let s:normal_bg = [ '#61afef', 255 ]
let s:insert_bg = [ '#98c379', 255 ]
let s:visual_bg = [ '#c678dd', 255 ]
let s:replace_bg = [ '#e06c75', 255 ]
let s:warning_bg = [ '#e5c07b', 255 ]
let s:error_bg = [ '#e06c75', 255 ]
let s:dark = [ '#474747', 255 ]

"{{{
let s:normal_l1_fg = s:dark
let s:normal_l1_bg = s:normal_bg
let s:normal_l2_fg = s:light_fg
let s:normal_l2_bg = s:base1
let s:normal_r1_fg = s:light_fg
let s:normal_r1_bg = s:base0
let s:normal_r2_fg = s:light_fg
let s:normal_r2_bg = s:base1

let s:insert_l1_fg = s:dark
let s:insert_l1_bg = s:insert_bg
let s:insert_l2_fg = s:light_fg
let s:insert_l2_bg = s:base1
let s:insert_r1_fg = s:light_fg
let s:insert_r1_bg = s:base0
let s:insert_r2_fg = s:light_fg
let s:insert_r2_bg = s:base1

let s:visual_l1_fg = s:dark
let s:visual_l1_bg = s:visual_bg
let s:visual_l2_fg = s:light_fg
let s:visual_l2_bg = s:base1
let s:visual_r1_fg = s:light_fg
let s:visual_r1_bg = s:base0
let s:visual_r2_fg = s:light_fg
let s:visual_r2_bg = s:base1

let s:inactive_l1_fg = s:dark
let s:inactive_l1_bg = s:base1
let s:inactive_l2_fg = s:light_fg
let s:inactive_l2_bg = s:base1
let s:inactive_r1_fg = s:light_fg
let s:inactive_r1_bg = s:base0
let s:inactive_r2_fg = s:light_fg
let s:inactive_r2_bg = s:base1

let s:tab_l_fg = s:light_fg
let s:tab_l_bg = s:base1
let s:tab_sel_fg = s:light_fg
let s:tab_sel_bg = s:base0

let s:replace_l1_fg = s:dark
let s:replace_l1_bg = s:replace_bg
let s:replace_l2_fg = s:light_fg
let s:replace_l2_bg = s:base1

let s:middle_fg = s:base0
let s:middle_bg = s:base2

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

let g:lightline#colorscheme#tfw_light#palette = lightline#colorscheme#flatten(s:p)
