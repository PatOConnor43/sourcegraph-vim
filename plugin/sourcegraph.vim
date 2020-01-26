if exists('g:sourcegraph_vim_loaded')
    finish
endif
if !exists('g:sourcegraph_vim_url')
    let g:sourcegraph_vim_url = 'https://sourcegraph.com/'
endif

let g:sourcegraph_vim_loaded = 1

function! SourcegraphCopyUrl() range
    let s:remote_url = sourcegraph#getRemoteUrl()
    let s:commit = sourcegraph#getCommit()
    let s:relative_path = expand('%')
    let l:built_url = sourcegraph#buildUrl(s:remote_url, s:commit, s:relative_path, a:firstline, a:lastline)
    echomsg l:built_url
    let @+ = l:built_url

endfunction

command! -range SourcegraphCopyUrl <line1>,<line2>call SourcegraphCopyUrl()
