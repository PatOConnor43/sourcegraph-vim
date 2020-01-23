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
    let s:branch = sourcegraph#getBranch()
    let s:relative_path = expand('%')
    call system('open https://google.com')


endfunction
