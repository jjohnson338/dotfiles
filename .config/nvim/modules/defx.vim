autocmd FileType defx setlocal statusline=defx
set conceallevel=2
set concealcursor=nc
call defx#custom#column('icon', {
  \ 'directory_icon': ' ',
  \ 'opened_icon':  ' ',
  \ 'root_icon': '',
  \ 'root_marker_highlight': 'Ignore',
  \ })
call defx#custom#column('filename', {
  \ 'root_marker_highlight': 'Ignore',
  \ 'max_width': '200'
  \ })
call defx#custom#column('mark', {
  \ 'readonly_icon': '✗',
  \ 'selected_icon': '',
  \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '',
  \ 'Staged'    : '+',
  \ 'Untracked' : '?',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })
call defx#custom#option('_', {
  \ 'winwidth': 50,
  \ 'columns': 'mark:indent:git:icon:icons:filename',
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 1,
  \ 'buffer_name': 'defx',
  \ 'toggle': 1,
  \ 'resume': 1,
  \ 'listed': 1,
  \ 'root_marker': ':'
  \ })

function! s:change_defx_buffer_dir() abort
  :Defx
  call defx#call_action('cd', expand('%:p:h'))
endfunction

" Whenever a directory is changed, open Defx and change it's dir
autocmd DirChanged * call s:change_defx_buffer_dir()
