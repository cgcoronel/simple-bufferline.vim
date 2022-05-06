# Simple Buffer line for VIM

> Minimal plugin that show in status bar and move between tabs buffer in vim

Use 'm' to move previous buffer and '.' to move next buffer. This plugin only native buffer and minimalist interface.

## Example
<img src="https://github.com/cgcoronel/simple-bufferline.vim/blob/main/1.jpeg" width="500" height="130">

## Install

I use [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'cgcoronel/simple-bufferlist.vim'
```

You can assign your own keyboard shortcut:

```vim
" Use for previous buffer tab
let g:simple_bufferline_prev= 'm'

" Use for next buffer tab
let g:simple_bufferline_next= '.'

" Customize selector
let g:simple_bufferline_sel_open= '['
let g:simple_bufferline_sel_close= ']'
```
## Related

* [My dotfiles](https://github.com/cgcoronel/vim-setup)
