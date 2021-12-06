let g:EditorConfig_exclude_patterns = ['fugitive://.*']
augroup _editorconfig
  autocmd BufEnter * :EditorConfigReload
augroup END
