" Custom filetypes
augroup filetypedetect
  au! BufRead,BufNewFile *.fsproj   setfiletype fsproj
augroup end

autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp

" Markdown
autocmd BufNewFile,BufRead *.md setlocal wrap linebreak
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown syntax=markdown
autocmd FileType vimwiki setlocal syntax=markdown
autocmd FileType vimwiki setlocal linebreak

" For commentary
autocmd FileType fsharp setlocal commentstring=//%s

" Filetype indentations
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType snip setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType fsproj setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab formatoptions-=c formatoptions-=r formatoptions-=o
