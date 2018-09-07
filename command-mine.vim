" 全バッファのファイルを再読込する
command! -nargs=0 Reload bufdo e!

" 全バッファに対してgrepする
" command! -nargs=1 BufGrep call s:bufgrep(<q-args>)
"
" function! s:bufgrep(pattern)
"   bufdo vimgrepa a:pattern '%'
" endfunction
