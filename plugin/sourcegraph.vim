if exists('g:sourcegraph_vim_loaded')
    finish
endif
if !exists('g:sourcegraph_url')
    let g:sourcegraph_url = 'https://sourcegraph.com'
endif
let g:sourcegraph_vim_loaded = 1

function! s:OpenCommand abort
    let s:remote_url = sourcegraph_vim#getRemoteUrl()
    let s:branch = sourcegraph_vim#getBranch()
    let s:relative_path = expand('%')

endfunction
