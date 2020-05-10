" ---------------------
" Lightline Theme Setup
" ---------------------


" Setup Components
let g:lightline.active = {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'syntastic' ], ['ctrlpmark'] ],
            \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ }

let g:lightline.component_function = {
            \   'fugitive': 'LightLineFugitive',
            \   'filename': 'LightLineFilename',
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode',
            \   'ctrlpmark': 'CtrlPMark',
            \ }

let g:lightline.component_expand = {'syntastic': 'SyntasticStatuslineFlag'}

let g:lightline.component_type = {'syntastic': 'error'}


" Mode
function! LightLineMode()
    let fname = expand('%:t')
    return fname == 'ControlP' ? 'CtrlP' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' : lightline#mode()
endfunction


" Fugitive
function! LightLineFugitive()
    try
        if expand('%:t') !~? 'ControlP\|Gundo\|NERD' && exists('*FugitiveHead')
            return FugitiveHead()
        endif
    catch
    endtry
    return ''
endfunction


" Filename
function! LightLineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' ? g:lightline.ctrlp_item :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction


" File Info
function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction


" Syntastic Setup
function! SyntasticCheckHook(errors)
    call lightline#update()
endfunction

let syntastic_stl_format = '[%e:%w - %F]'


" Ctrl-P Specific Setup
function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item, g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusMain',
            \ 'prog': 'CtrlPStatusProg',
            \ }

function! CtrlPStatusMain(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusProg(str)
    return lightline#statusline(0)
endfunction
