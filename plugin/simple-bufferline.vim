if !exists('g:simple_bufferline_sel_open') | let g:simple_bufferline_sel_open= '[' | en
if !exists('g:simple_bufferline_sel_close') | let g:simple_bufferline_sel_close= ']' | en

if !exists('g:simple_bufferline_prev') | let g:simple_bufferline_prev= 'm' | en
if !exists('g:simple_bufferline_next') | let g:simple_bufferline_next= '.' | en

exe 'map ' g:simple_bufferline_next ' :call BuferList("n")<CR>'
exe 'map ' g:simple_bufferline_prev ' :call SimpleTerm("p")<CR>'

function! BufferList(p = 'n')
    if a:p == 'n' 
      :silent bnext
    else
      :silent bprevious
    endif

    let l:blist = getbufinfo()
    let bar = 'Buf> '

    for l:item in l:blist
        if l:item.listed == 0 | continue | endif

        let array = split(l:item.name, '/')

        let name = ''
        if len(array) > 0 || index(tabpagebuflist(), l:item.bufnr) > 0 
          let name = array[-1]
        else
          continue
        endif  

        if name == 'NERD_tree_1' || name == 'index'
          continue
        endif

        if expand('%:t') == name
          let bar = bar . g:simple_bufferline_sel_open . name . g:simple_bufferline_sel_close 
        else
          let bar = bar . ' ' . name . ' '
        endif
    endfor

    echo bar 
endfunction
