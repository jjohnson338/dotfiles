let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 1
let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'files',     'header': ['   Recents']            },
  \ { 'type': 'dir',       'header': ['   Recents '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ ]

" Eat all File Explorer Buffer opens
au VimEnter * sil! au! FileExplorer *
