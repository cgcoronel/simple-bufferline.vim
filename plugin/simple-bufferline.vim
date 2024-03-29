if !exists('g:simple_bufferline_sel_open') | let g:simple_bufferline_sel_open= '[' | en
if !exists('g:simple_bufferline_sel_close') | let g:simple_bufferline_sel_close= ']' | en

function! BufferList(direction = 'next')
    if &filetype == 'netrw'
      exe ":bdelete!"
    endif

    exe a:direction == "next" ? ":bnext" : ":bprev"
   
    let l:blist = getbufinfo()

    echohl Normal
    echo 'Buffers> '
    echohl None

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
          echohl Search 
          echon g:simple_bufferline_sel_open . name . g:simple_bufferline_sel_close 
          echohl None
        else
          echohl Normal 
          echon ' ' . name . ' '
          echohl None
        endif
    endfor
endfunction

if !exists('g:simple_bufferline_prev') | let g:simple_bufferline_prev= 'm' | en
if !exists('g:simple_bufferline_next') | let g:simple_bufferline_next= '.' | en

exe 'map ' g:simple_bufferline_prev ' :call BufferList("prev")<CR>'
exe 'map ' g:simple_bufferline_next ' :call BufferList("next")<CR>'
