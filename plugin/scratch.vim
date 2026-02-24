
if exists("g:scratch_loaded") || &cp
  finish
endif
let g:scratch_loaded = 1

let g:scratch_dir = get(g:, 'scratch_dir', '/tmp')

augroup scratch
  autocmd!
  " fallback to markdown file type if all ftdetect fails
  autocmd BufRead,BufNewFile *.scratch setfiletype markdown.scratch
  " do not wrap actual lines
  autocmd BufRead,BufNewFile *.scratch setlocal list spell wrap textwidth=0 wrapmargin=5 noswapfile fo=roqnmB1 nofixeol
  " no netrw in scratch
  autocmd BufRead,BufNewFile *.scratch unmap -
  " paste to clipboard when saving.
  autocmd BufWritePost *.scratch if getfsize(expand(@%))>0 | silent :%y+ | endif
  " delete tmp file when exiting
  autocmd BufDelete,BufHidden,VimLeave *.scratch silent :call delete(@%)
augroup END

function! s:scratch_edit(cmd)
  execute ":e " . a:cmd . ' ' . g:scratch_dir . '/' . strftime('%Y%m%d.%H%M%S') . '.scratch'
endfunction

function! s:scratch_clip(cmd)
  execute ":e " . a:cmd . ' ' . g:scratch_dir . '/' . strftime('%Y%m%d.%H%M%S') . '.scratch'
  if getreg('+') != ''
    silent normal! "+P
  endif
endfunction

command! -nargs=? Scratch :call <sid>scratch_edit(<q-args>)
command! -nargs=? ScratchClip :call <sid>scratch_clip(<q-args>)
