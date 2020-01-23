if exists('g:sourcegraph_vim_loaded')
    finish
endif
if !exists('g:sourcegraph_url')
    let g:sourcegraph_url = 'https://sourcegraph.com'
endif

if !exists('g:sourcegraph_vim_bindings')
    let g:sourcegraph_vim_bindings = 1
endif

let g:sourcegraph_vim_loaded = 1


if g:sourcegraph_vim_bindings && !hasmapto('<Plug>OpenCommand')
      nmap <unique> <Leader>s <Plug>OpenCommand
  endif

noremap <silent> <unique> <script> <Plug>OpenCommand :call <SID>OpenCommand()<CR>

function! s:OpenCommand() abort
    let s:remote_url = sourcegraph#getRemoteUrl()
    let s:commit = sourcegraph#getCommit()
    let s:relative_path = expand('%')
    let g:built_url = sourcegraph#buildUrl(s:remote_url, s:commit, s:relative_path)
    echo g:built_url
    let @+ = g:built_url

endfunction
