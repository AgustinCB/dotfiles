function! s:Bopen(buffer)
  execute 'badd '.a:buffer
  let btarget = bufnr(a:buffer)
  execut 'bnext '.btarget
endfunction

command! -complete=file -nargs=1 Bopen call s:Bopen('<args>')
command! -complete=file -nargs=1 Bo call s:Bopen('<args>')
" nnoremap <silent> <Leader>bo :Bopen<CR>
